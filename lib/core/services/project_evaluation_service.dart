import 'dart:convert';
import 'dart:developer';

import '../api/project_api_client.dart';
import '../model/project_analyzer_models.dart';
import '../model/project_evaluator_models.dart';
import '../utils/file_utils.dart';
import '../utils/text_processing_utils.dart';

class ProjectEvaluationService {
  final ProjectApiClient _apiClient;

  /// Maximum characters per request
  static const int _maxCharactersPerRequest = 256000;

  /// Maximum tokens per thread for gpt-4o-mini
  static const int _maxTokensPerThreadFor4oMini = 60000;

  /// Maximum tokens per thread for gpt-4o
  static const int _maxTokensPerThreadFor4o = 4000;

  ProjectEvaluationService(this._apiClient);

  /// Main method to process a project (analyze or evaluate)
  ///
  /// [isAnalysisPhase] determines whether to run analysis or evaluation
  Future<dynamic> processProject({
    required bool isAnalysisPhase,
    required String? selectedDirectory,
    required List<String>? importantFilePaths,
    required ProjectAnalysisResponse? projectAnalysisResponse,
    required String? userRemarks,
  }) async {
    try {
      // Validate prerequisites
      _validatePrerequisites(
        isAnalysisPhase,
        selectedDirectory,
        importantFilePaths,
        projectAnalysisResponse,
        userRemarks,
      );

      // Configure request limits
      final maxContentCharactersPerRequest = _maxCharactersPerRequest - 5000;
      final maxTokensPerThread = _maxTokensPerThreadFor4oMini - 5000;
      final batchSize = (maxContentCharactersPerRequest / 2).floor();

      // Get project files
      final projectFilesWithPaths = await _getProjectFiles(
        isAnalysisPhase,
        selectedDirectory!,
        importantFilePaths ?? [],
      );

      // Create batches
      List<String> fileMessageBatches = createFileMessageContentBatches(
        projectFilesWithPaths,
        batchSize,
      );

      // Process batches in threads
      dynamic latestResponse;
      List<String> updatedImportantFilePaths =
          importantFilePaths?.toList() ?? [];

      while (fileMessageBatches.isNotEmpty) {
        var usedTokensInCurrentThread = 0;

        // Create a new thread
        final threadId = await _apiClient.createThread();

        // Send previous response if available
        if (latestResponse != null) {
          usedTokensInCurrentThread += await _sendPreviousResponse(
            threadId,
            latestResponse,
            projectAnalysisResponse,
            userRemarks,
            isAnalysisPhase,
            maxContentCharactersPerRequest,
          );
        }

        // Process and send file batches
        final messageBatchesToRemove = <String>[];

        // Send messages until token limit is reached
        for (var message in fileMessageBatches) {
          final messageTokens = estimateTokensInText(message);

          if (usedTokensInCurrentThread + messageTokens > maxTokensPerThread) {
            break;
          }

          usedTokensInCurrentThread += messageTokens;
          messageBatchesToRemove.add(message);
          await _apiClient.sendMessageToTheThread(threadId, message);
        }

        // Create and monitor run
        final runId = await _apiClient.createRun(threadId, isAnalysisPhase);
        await _waitForRunToComplete(threadId, runId);

        // Process response
        final response = await _apiClient.retrieveLastAssistantMessage(
          threadId,
        );

        if (isAnalysisPhase) {
          final analysisResponse = ProjectAnalysisResponse.fromJson(response);
          // Update important file paths
          updatedImportantFilePaths = _getUpdatedImportantFilePaths(
            updatedImportantFilePaths,
            analysisResponse.importantFilePaths,
            selectedDirectory,
          );
          latestResponse = analysisResponse;
        } else {
          latestResponse = ProjectEvaluationResponse.fromJson(response);
        }

        // Remove sent messages from the batch
        fileMessageBatches.removeWhere(
          (message) => messageBatchesToRemove.contains(message),
        );

        if (fileMessageBatches.isNotEmpty) {
          log(
            'Waiting for 1 minute before sending next batch (not to hit TPM limit)',
          );
          await Future.delayed(const Duration(minutes: 1));
        }
      }

      // Return the response and updated file paths
      if (isAnalysisPhase) {
        return {
          'analysisResponse': latestResponse,
          'importantFilePaths': updatedImportantFilePaths,
        };
      } else {
        return {'evaluationResponse': latestResponse};
      }
    } catch (e) {
      final phase = isAnalysisPhase ? "analyze" : "evaluate";
      throw Exception('Failed to $phase project: $e');
    }
  }

  /// Validates prerequisites for each phase
  void _validatePrerequisites(
    bool isAnalysisPhase,
    String? selectedDirectory,
    List<String>? importantFilePaths,
    ProjectAnalysisResponse? projectAnalysisResponse,
    String? userRemarks,
  ) {
    if (isAnalysisPhase) {
      // Analysis phase requires a selected directory
      if (selectedDirectory == null) {
        throw Exception('Project directory is not selected');
      }
    } else {
      // Evaluation phase requires analysis results and important file paths
      if (importantFilePaths == null || projectAnalysisResponse == null) {
        throw Exception(
          'Project analysis or important files are not available',
        );
      }
    }
  }

  /// Gets the project files based on the phase
  Future<Map<String, String>> _getProjectFiles(
    bool isAnalysisPhase,
    String selectedDirectory,
    List<String> importantFilePaths,
  ) async {
    if (isAnalysisPhase) {
      return await readImportantProjectFiles(selectedDirectory);
    } else {
      return await readFilesFromPaths(importantFilePaths);
    }
  }

  /// Sends the previous response to the thread
  Future<int> _sendPreviousResponse(
    String threadId,
    dynamic previousResponse,
    ProjectAnalysisResponse? projectAnalysisResponse,
    String? userRemarks,
    bool isAnalysisPhase,
    int maxContentCharactersPerRequest,
  ) async {
    String jsonMessageContent;

    if (isAnalysisPhase) {
      jsonMessageContent =
          'Previous project analysis: ${jsonEncode(previousResponse)}';
    } else {
      jsonMessageContent =
          'Previous project evaluation: ${jsonEncode(previousResponse)}, '
          'project analysis: ${jsonEncode(projectAnalysisResponse)}, '
          'user remarks: ${userRemarks ?? 'none'}';
    }

    // Ensure the message fits within limits
    jsonMessageContent = _getShortedMessageToFitIfNeeded(
      jsonMessageContent,
      maxContentCharactersPerRequest,
    );

    final tokens = estimateTokensInText(jsonMessageContent);
    await _apiClient.sendMessageToTheThread(threadId, jsonMessageContent);

    return tokens;
  }

  /// Waits for a run to complete
  Future<void> _waitForRunToComplete(String threadId, String runId) async {
    bool isRunCompleted = false;
    while (!isRunCompleted) {
      isRunCompleted = await _apiClient.checkRunStatus(threadId, runId);
      if (!isRunCompleted) {
        await Future.delayed(const Duration(seconds: 5));
      }
    }
  }

  /// Short message to fit within the character limit
  String _getShortedMessageToFitIfNeeded(
    String jsonMessageContent,
    int maxContentCharactersPerRequest,
  ) {
    if (jsonMessageContent.length > maxContentCharactersPerRequest) {
      jsonMessageContent = jsonMessageContent.substring(
        0,
        maxContentCharactersPerRequest,
      );
    }
    return jsonMessageContent;
  }

  /// Get updated important file paths list
  List<String> _getUpdatedImportantFilePaths(
    List<String> existingPaths,
    List<String> newPaths,
    String? selectedDirectory,
  ) {
    // Create a new list to store unique paths
    final List<String> uniquePaths = List.from(existingPaths, growable: true);

    // Add new paths that aren't already in the list
    // and don't contain the selected directory
    for (final path in newPaths) {
      if (!uniquePaths.contains(path) &&
          (selectedDirectory == null || path.contains(selectedDirectory))) {
        uniquePaths.add(path);
      }
    }

    return uniquePaths;
  }
}

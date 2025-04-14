import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_ai_code_analyser/core/config/env_var.dart';

class ProjectApiClient {
  final Dio _dio;

  // API Constants
  final String _openAiBaseUrl = EnvVar.openAiBaseUrl;

  // Assistant IDs
  final String _analyzerAssistantId = EnvVar.analyzerAssistantId;
  final String _evaluatorAssistantId = EnvVar.evaluatorAssistantId;

  // API Authentication
  final String _apiKey = EnvVar.apiKey;
  final String _orgId = EnvVar.orgId;
  final String _projectId = EnvVar.projectId;

  ProjectApiClient({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = _openAiBaseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_apiKey',
      'OpenAI-Organization': _orgId,
      'OpenAI-Project': _projectId,
      'OpenAI-Beta': 'assistants=v2',
    };

    // Add logging interceptor
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: false,
        // Set to false to avoid logging large request bodies
        responseHeader: true,
        responseBody: false,
        // Set to false to avoid logging large response bodies
        error: true,
        logPrint: (object) {
          debugPrint('DIO LOG: $object');
        },
      ),
    );
  }

  /// Step 1: Create a new thread
  Future<String> createThread() async {
    try {
      final response = await _dio.post(
        '$_openAiBaseUrl/threads',
        options: Options(responseType: ResponseType.json),
      );
      log('Thread created: ${response.data}');
      return response.data['id'];
    } catch (e) {
      log('Error creating thread: $e');
      throw Exception('Failed to create thread: $e');
    }
  }

  /// Step 2: Send messages to the thread (limit pro 1 request: 256 000 characters, limit pro 1 minute: Y)
  Future<void> sendMessageToTheThread(
    String threadId,
    String jsonMessageContent,
  ) async {
    try {
      await _dio.post(
        '$_openAiBaseUrl/threads/$threadId/messages',
        data: {'role': 'user', 'content': jsonMessageContent},
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Failed to send messages to thread: status: ${e.response?.statusCode}, data: ${e.response?.data}',
        );
      }
      throw Exception('Failed to send messages to thread: $e');
    } catch (e) {
      log('Error sending messages to thread: $e');
      rethrow;
    }
  }

  /// Step 3: Create a run for assistant to analyze or evaluate the messages
  Future<String> createRun(
    String threadId,
    // Now we have two assistants: analyzer and evaluator, so NOT analyzer means evaluator
    bool isAnalyzerAssistant,
  ) async {
    try {
      final response = await _dio.post(
        '$_openAiBaseUrl/threads/$threadId/runs',
        data: jsonEncode({
          'assistant_id':
              isAnalyzerAssistant
                  ? _analyzerAssistantId
                  : _evaluatorAssistantId,
          'instructions':
              isAnalyzerAssistant
                  ? 'Analyze the project files and provide a detailed summary of the project structure, architecture, and key components.'
                  : 'Evaluate the project based on the summary and files provided. Consider code quality, architecture, and design patterns.',
        }),
      );
      log('Run created: ${response.data}');
      return response.data['id'];
    } catch (e) {
      log('Error creating run: $e');
      throw Exception('Failed to create run: $e');
    }
  }

  /// Step 4: Check the status of a run
  Future<bool> checkRunStatus(String threadId, String runId) async {
    try {
      final response = await _dio.get(
        '$_openAiBaseUrl/threads/$threadId/runs/$runId',
      );

      var runStatus = response.data['status'];
      log('Run status: $runStatus');

      if (runStatus == 'queued' ||
          runStatus == 'in_progress' ||
          runStatus == 'completed') {
        return runStatus == 'completed';
      } else {
        if (response.data['last_error'] != null) {
          throw Exception(
            'Run failed: $runStatus, ${response.data['last_error']['code']}, ${response.data['last_error']['message']}',
          );
        }
        throw Exception('Run failed: $runStatus');
      }
    } catch (e) {
      log('Run status check error: $e');
      throw Exception('Run status check error: $e');
    }
  }

  /// Step 4: Retrieve last assistant message from the thread
  Future<Map<String, dynamic>> retrieveLastAssistantMessage(
    String threadId,
  ) async {
    try {
      final response = await _dio.get(
        '$_openAiBaseUrl/threads/$threadId/messages',
      );
      final List<dynamic> messages = response.data['data'];
      final assistantMessages =
          messages.where((msg) => msg['role'] == 'assistant').toList();

      if (assistantMessages.isEmpty) {
        log('No assistant messages found');
        throw Exception('No assistant messages found');
      }

      // Parse the last message from the assistant
      final lastMessage = assistantMessages.first;
      return jsonDecode(lastMessage['content'][0]['text']['value']);
    } catch (e) {
      log('Error retrieving messages: $e');
      throw Exception('Failed to retrieve messages: $e');
    }
  }
}

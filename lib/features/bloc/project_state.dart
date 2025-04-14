import 'package:equatable/equatable.dart';

import '../../core/model/project_analyzer_models.dart';
import '../../core/model/project_evaluator_models.dart';
import '../../core/model/project_history_item_model.dart';

class ProjectState extends Equatable {
  // COMMON FIELDS
  final bool isLoading;
  final String? errorMessage;
  final bool isHistoricalView;

  // DATABASE / SESSION FIELDS
  final List<ProjectHistoryItem>? projectHistory;

  // PHASE 1 FIELDS: Analyze a project
  final String? selectedDirectory;
  final List<String>? importantFilePaths;
  final ProjectAnalysisResponse? projectAnalysisResponse;

  // PHASE 2 FIELDS: Evaluate project
  final String? userRemarks;
  final ProjectEvaluationResponse? projectEvaluationResponse;

  const ProjectState({
    this.selectedDirectory,
    this.importantFilePaths,
    this.projectAnalysisResponse,
    this.projectEvaluationResponse,
    this.userRemarks,
    this.isLoading = false,
    this.errorMessage,
    this.projectHistory,
    this.isHistoricalView = false,
  });

  // Factory constructor for initial state
  factory ProjectState.initial() {
    return const ProjectState(
      isLoading: false,
      errorMessage: null,
      isHistoricalView: false,
    );
  }

  // Factory for setting up a new project directory
  factory ProjectState.newProject(String projectPath, ProjectState current) {
    return ProjectState(
      selectedDirectory: projectPath,
      importantFilePaths: null,
      projectAnalysisResponse: null,
      projectEvaluationResponse: null,
      userRemarks: null,
      errorMessage: null,
      isHistoricalView: false,
      isLoading: false,
      projectHistory: current.projectHistory,
    );
  }

  // Factory for error states
  factory ProjectState.withError(String error, ProjectState current) {
    return ProjectState(
      selectedDirectory: current.selectedDirectory,
      importantFilePaths: current.importantFilePaths,
      projectAnalysisResponse: current.projectAnalysisResponse,
      projectEvaluationResponse: current.projectEvaluationResponse,
      userRemarks: current.userRemarks,
      isLoading: false,
      // Always stop loading on error
      errorMessage: error,
      projectHistory: current.projectHistory,
      isHistoricalView: current.isHistoricalView,
    );
  }

  // Factory for loading states
  factory ProjectState.loading(ProjectState current) {
    return ProjectState(
      selectedDirectory: current.selectedDirectory,
      importantFilePaths: current.importantFilePaths,
      projectAnalysisResponse: current.projectAnalysisResponse,
      projectEvaluationResponse: current.projectEvaluationResponse,
      userRemarks: current.userRemarks,
      isLoading: true,
      errorMessage: null,
      // Clear error on new loading
      projectHistory: current.projectHistory,
      isHistoricalView: current.isHistoricalView,
    );
  }

  // Factory for analysis complete state
  factory ProjectState.analysisComplete({
    required ProjectState current,
    required ProjectAnalysisResponse analysisResponse,
    required List<String> importantFilePaths,
  }) {
    return ProjectState(
      selectedDirectory: current.selectedDirectory,
      importantFilePaths: importantFilePaths,
      projectAnalysisResponse: analysisResponse,
      projectEvaluationResponse: current.projectEvaluationResponse,
      userRemarks: current.userRemarks,
      isLoading: false,
      errorMessage: null,
      projectHistory: current.projectHistory,
      isHistoricalView: current.isHistoricalView,
    );
  }

  // Factory for evaluation complete state
  factory ProjectState.evaluationComplete({
    required ProjectState current,
    required ProjectEvaluationResponse evaluationResponse,
  }) {
    return ProjectState(
      selectedDirectory: current.selectedDirectory,
      importantFilePaths: current.importantFilePaths,
      projectAnalysisResponse: current.projectAnalysisResponse,
      projectEvaluationResponse: evaluationResponse,
      userRemarks: current.userRemarks,
      isLoading: false,
      errorMessage: null,
      projectHistory: current.projectHistory,
      isHistoricalView: current.isHistoricalView,
    );
  }

  // Factory for loading a historical session
  factory ProjectState.historicalSession({
    required String selectedDirectory,
    required ProjectAnalysisResponse analysisResponse,
    required ProjectEvaluationResponse evaluationResponse,
    required String? userRemarks,
  }) {
    return ProjectState(
      selectedDirectory: selectedDirectory,
      importantFilePaths: null,
      projectAnalysisResponse: analysisResponse,
      projectEvaluationResponse: evaluationResponse,
      userRemarks: userRemarks,
      isLoading: false,
      errorMessage: null,
      isHistoricalView: true,
    );
  }

  // Factory for projects history loaded
  factory ProjectState.projectHistoryLoaded({
    required List<ProjectHistoryItem> projectHistory,
    required ProjectState current,
  }) {
    return ProjectState(
      selectedDirectory: current.selectedDirectory,
      importantFilePaths: current.importantFilePaths,
      projectAnalysisResponse: current.projectAnalysisResponse,
      projectEvaluationResponse: current.projectEvaluationResponse,
      userRemarks: current.userRemarks,
      isLoading: false,
      errorMessage: null,
      projectHistory: projectHistory,
      isHistoricalView: current.isHistoricalView,
    );
  }

  ProjectState copyWith({
    String? selectedDirectory,
    List<String>? importantFilePaths,
    ProjectAnalysisResponse? projectAnalysisResponse,
    ProjectEvaluationResponse? projectEvaluationResponse,
    String? userRemarks,
    bool? isLoading,
    String? errorMessage,
    List<ProjectHistoryItem>? projectHistory,
    bool? isHistoricalView,
    bool clearSelectedDirectory = false,
    bool clearImportantFilePaths = false,
    bool clearProjectAnalysisResponse = false,
    bool clearProjectEvaluationResponse = false,
    bool clearUserRemarks = false,
    bool clearErrorMessage = false,
    bool clearProjectHistory = false,
  }) {
    return ProjectState(
      selectedDirectory:
          clearSelectedDirectory
              ? null
              : (selectedDirectory ?? this.selectedDirectory),
      importantFilePaths:
          clearImportantFilePaths
              ? null
              : (importantFilePaths ?? this.importantFilePaths),
      projectAnalysisResponse:
          clearProjectAnalysisResponse
              ? null
              : (projectAnalysisResponse ?? this.projectAnalysisResponse),
      projectEvaluationResponse:
          clearProjectEvaluationResponse
              ? null
              : (projectEvaluationResponse ?? this.projectEvaluationResponse),
      userRemarks: clearUserRemarks ? null : (userRemarks ?? this.userRemarks),
      isLoading: isLoading ?? this.isLoading,
      errorMessage:
          clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
      projectHistory:
          clearProjectHistory ? null : (projectHistory ?? this.projectHistory),
      isHistoricalView: isHistoricalView ?? this.isHistoricalView,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    selectedDirectory,
    importantFilePaths,
    projectAnalysisResponse,
    userRemarks,
    projectEvaluationResponse,
    isHistoricalView,
    // Don't include projectHistory in equality check to avoid excessive rebuilds
  ];
}

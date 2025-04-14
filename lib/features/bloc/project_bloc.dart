import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/model/project_analyzer_models.dart';
import '../../core/model/project_evaluator_models.dart';
import '../../core/model/project_history_item_model.dart';
import '../../core/model/project_session_model.dart';
import '../../core/services/database_service.dart';
import '../../core/services/project_evaluation_service.dart';
import 'project_events.dart';
import 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectEvaluationService _evaluationService;
  final DatabaseService _databaseService;

  ProjectBloc(this._evaluationService, this._databaseService)
    : super(ProjectState.initial()) {
    on<ChooseProjectDirectoryEvent>(_onChooseProjectDirectory);
    on<AddUserRemarksEvent>(_onAddUserRemarks);
    on<AnalyzeProjectEvent>(_onAnalyzeProject);
    on<EvaluateProjectEvent>(_onEvaluateProject);
    on<LoadProjectSessionEvent>(_onLoadProjectSession);
    on<LoadAllProjectsEvent>(_onLoadAllProjects);
    on<DeleteProjectSessionEvent>(_onDeleteProjectSession);
    on<DeleteProjectEvent>(_onDeleteProject);
  }

  /// Choose a project directory and update the state
  void _onChooseProjectDirectory(
    ChooseProjectDirectoryEvent event,
    Emitter<ProjectState> emit,
  ) {
    try {
      log('Setting directory: ${event.projectPath}');
      emit(ProjectState.newProject(event.projectPath, state));
      log(
        'New state after directory set - selectedDirectory: ${state.selectedDirectory}',
      );
    } catch (e) {
      log('Error selecting directory: $e');
      emit(ProjectState.withError('Failed to select directory: $e', state));
    }
  }

  /// Add user remarks to the state
  void _onAddUserRemarks(
    AddUserRemarksEvent event,
    Emitter<ProjectState> emit,
  ) {
    try {
      log('Setting user remarks: ${event.remarks}');
      emit(state.copyWith(userRemarks: event.remarks, clearErrorMessage: true));
      log('New state after remarks set - userRemarks: ${state.userRemarks}');
    } catch (e) {
      log('Error adding remarks: $e');
      emit(ProjectState.withError('Failed to add user remarks: $e', state));
    }
  }

  /// Analyze the project
  Future<void> _onAnalyzeProject(
    AnalyzeProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    try {
      log('Starting project analysis');
      emit(ProjectState.loading(state));

      final result = await _evaluationService.processProject(
        isAnalysisPhase: true,
        selectedDirectory: state.selectedDirectory,
        importantFilePaths: state.importantFilePaths,
        projectAnalysisResponse: state.projectAnalysisResponse,
        userRemarks: state.userRemarks,
      );

      final analysisResponse =
          result['analysisResponse'] as ProjectAnalysisResponse;
      final importantFilePaths = result['importantFilePaths'] as List<String>;

      log('Analysis completed successfully');
      log('Project summary: ${analysisResponse.projectSummary.projectName}');
      log('Important files count: ${importantFilePaths.length}');

      emit(
        ProjectState.analysisComplete(
          current: state,
          analysisResponse: analysisResponse,
          importantFilePaths: importantFilePaths,
        ),
      );

      log(
        'New state after analysis - has analysisResponse: ${state.projectAnalysisResponse != null}',
      );
    } catch (e) {
      log('Analysis failed: $e');
      emit(ProjectState.withError('Failed to analyze project: $e', state));
    }
  }

  /// Evaluate the project based on analysis results
  Future<void> _onEvaluateProject(
    EvaluateProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    try {
      // Log current state to debug
      log('Evaluation started with state:');
      log('Directory: ${state.selectedDirectory}');
      log('Has analysis response: ${state.projectAnalysisResponse != null}');
      log('Important files count: ${state.importantFilePaths?.length ?? 0}');
      log('User remarks: ${state.userRemarks}');

      // Ensure we have analysis results before attempting evaluation
      if (state.projectAnalysisResponse == null) {
        throw Exception('Project analysis must be completed before evaluation');
      }

      emit(ProjectState.loading(state));

      final result = await _evaluationService.processProject(
        isAnalysisPhase: false,
        selectedDirectory: state.selectedDirectory,
        importantFilePaths: state.importantFilePaths,
        projectAnalysisResponse: state.projectAnalysisResponse,
        userRemarks: state.userRemarks,
      );

      final evaluationResponse =
          result['evaluationResponse'] as ProjectEvaluationResponse;

      log('Evaluation completed successfully');
      log('Overall rating: ${evaluationResponse.overallRating}');

      // Auto-save evaluation results to database
      if (state.selectedDirectory != null &&
          state.projectAnalysisResponse != null) {
        try {
          await _databaseService.saveProjectSession(
            selectedDirectory: state.selectedDirectory!,
            projectAnalysisResponse: state.projectAnalysisResponse!,
            userRemarks: state.userRemarks,
            projectEvaluationResponse: evaluationResponse,
          );
          log('Created new session with evaluation results');
        } catch (dbError) {
          log('Warning: Failed to save evaluation: $dbError');
        }
      }

      emit(
        ProjectState.evaluationComplete(
          current: state,
          evaluationResponse: evaluationResponse,
        ),
      );

      log(
        'New state after evaluation - has evaluationResponse: ${state.projectEvaluationResponse != null}',
      );
    } catch (e) {
      log('Evaluation failed: $e');
      emit(ProjectState.withError('Failed to evaluate project: $e', state));
    }
  }

  /// Load a specific project session
  Future<void> _onLoadProjectSession(
    LoadProjectSessionEvent event,
    Emitter<ProjectState> emit,
  ) async {
    try {
      log('Loading project session: ${event.timestamp}');
      emit(ProjectState.loading(state));

      final List<ProjectSession> sessions = await _databaseService
          .getProjectSessionsForProject(event.projectPath);

      final sessionToLoad = sessions.firstWhere(
        (session) => session.timestamp == event.timestamp,
        orElse: () => throw Exception('Session not found'),
      );

      log('Session loaded successfully');
      emit(
        ProjectState.historicalSession(
          selectedDirectory: sessionToLoad.selectedDirectory,
          analysisResponse: sessionToLoad.projectAnalysisResponse,
          evaluationResponse: sessionToLoad.projectEvaluationResponse,
          userRemarks: sessionToLoad.userRemarks,
        ),
      );

      log(
        'New state after session load - isHistoricalView: ${state.isHistoricalView}',
      );
    } catch (e) {
      log('Failed to load project session: $e');
      emit(ProjectState.withError('Failed to load project session: $e', state));
    }
  }

  /// Load all projects
  Future<void> _onLoadAllProjects(
    LoadAllProjectsEvent event,
    Emitter<ProjectState> emit,
  ) async {
    try {
      log('Loading all projects');
      emit(ProjectState.loading(state));

      final projects = await _databaseService.getAllProjects();

      // Convert to a more UI-friendly format
      final projectsList =
          projects.entries.map((entry) {
            return ProjectHistoryItem(
              projectPath: entry.key,
              sessions: entry.value,
            );
          }).toList();

      log('Loaded ${projectsList.length} projects');
      emit(
        ProjectState.projectHistoryLoaded(
          projectHistory: projectsList,
          current: state,
        ),
      );

      log(
        'New state after projects load - project count: ${state.projectHistory?.length ?? 0}',
      );
    } catch (e) {
      log('Failed to load projects: $e');
      emit(ProjectState.withError('Failed to load projects: $e', state));
    }
  }

  /// Delete a project session
  Future<void> _onDeleteProjectSession(
    DeleteProjectSessionEvent event,
    Emitter<ProjectState> emit,
  ) async {
    try {
      log('Deleting project session: ${event.timestamp}');
      emit(ProjectState.loading(state));

      await _databaseService.deleteProjectSession(
        selectedDirectory: event.projectPath,
        timestamp: event.timestamp,
      );

      log('Session deleted successfully');

      // Update the project history to reflect deletion
      if (state.projectHistory != null) {
        final updatedHistory =
            state.projectHistory!.map((project) {
              if (project.projectPath == event.projectPath) {
                return ProjectHistoryItem(
                  projectPath: project.projectPath,
                  sessions:
                      project.sessions
                          .where(
                            (session) => session.timestamp != event.timestamp,
                          )
                          .toList(),
                );
              }
              return project;
            }).toList();

        emit(
          ProjectState.projectHistoryLoaded(
            projectHistory: updatedHistory,
            current: state,
          ),
        );
      } else {
        emit(state.copyWith(isLoading: false));
      }

      log(
        'New state after session deletion - project count: ${state.projectHistory?.length ?? 0}',
      );
    } catch (e) {
      log('Failed to delete project session: $e');
      emit(
        ProjectState.withError('Failed to delete project session: $e', state),
      );
    }
  }

  /// Delete a project
  Future<void> _onDeleteProject(
    DeleteProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    try {
      log('Deleting project: ${event.projectPath}');
      emit(ProjectState.loading(state));

      await _databaseService.deleteProject(event.projectPath);

      log('Project deleted successfully');

      // Update the project history to reflect deletion
      if (state.projectHistory != null) {
        final updatedHistory =
            state.projectHistory!
                .where((project) => project.projectPath != event.projectPath)
                .toList();

        emit(
          ProjectState.projectHistoryLoaded(
            projectHistory: updatedHistory,
            current: state,
          ),
        );
      } else {
        emit(state.copyWith(isLoading: false));
      }

      log(
        'New state after project deletion - project count: ${state.projectHistory?.length ?? 0}',
      );
    } catch (e) {
      log('Failed to delete project: $e');
      emit(ProjectState.withError('Failed to delete project: $e', state));
    }
  }
}

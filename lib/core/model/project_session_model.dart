import 'package:universal_ai_code_analyser/core/model/project_analyzer_models.dart';
import 'package:universal_ai_code_analyser/core/model/project_evaluator_models.dart';

class ProjectSession {
  final String timestamp;
  final String selectedDirectory;
  final ProjectAnalysisResponse projectAnalysisResponse;
  final String? userRemarks;
  final ProjectEvaluationResponse projectEvaluationResponse;

  ProjectSession({
    required this.timestamp,
    required this.selectedDirectory,
    required this.projectAnalysisResponse,
    this.userRemarks,
    required this.projectEvaluationResponse,
  });

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'selectedDirectory': selectedDirectory,
      'projectAnalysisResponse': projectAnalysisResponse.toJson(),
      'userRemarks': userRemarks,
      'projectEvaluationResponse': projectEvaluationResponse.toJson(),
    };
  }

  factory ProjectSession.fromJson(Map<String, dynamic> json) {
    // Convert the nested JSON maps to model objects
    return ProjectSession(
      timestamp: json['timestamp'],
      selectedDirectory: json['selectedDirectory'],
      projectAnalysisResponse: ProjectAnalysisResponse.fromJson(
        json['projectAnalysisResponse'] as Map<String, dynamic>,
      ),
      userRemarks: json['userRemarks'],
      projectEvaluationResponse: ProjectEvaluationResponse.fromJson(
        json['projectEvaluationResponse'] as Map<String, dynamic>,
      ),
    );
  }
}

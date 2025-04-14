import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_evaluator_models.freezed.dart';
part 'project_evaluator_models.g.dart';

@freezed
class ProjectEvaluationResponse with _$ProjectEvaluationResponse {
  const factory ProjectEvaluationResponse({
    required Evaluation evaluation,
    required double overallRating,
    required String finalSummary,
  }) = _ProjectEvaluationResponse;

  factory ProjectEvaluationResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectEvaluationResponseFromJson(json);
}

@freezed
class Evaluation with _$Evaluation {
  const factory Evaluation({
    required EvaluationCategory suitability,
    required EvaluationCategory systemArchitecture,
    required EvaluationCategory technicalImplementation,
    required EvaluationCategory userExperienceInterface,
    required EvaluationCategory securityPrivacy,
  }) = _Evaluation;

  factory Evaluation.fromJson(Map<String, dynamic> json) =>
      _$EvaluationFromJson(json);
}

@freezed
class EvaluationCategory with _$EvaluationCategory {
  const factory EvaluationCategory({
    required double score,
    required List<String> strengths,
    required List<String> areasForImprovement,
    required List<String> recommendations,
  }) = _EvaluationCategory;

  factory EvaluationCategory.fromJson(Map<String, dynamic> json) =>
      _$EvaluationCategoryFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_analyzer_models.freezed.dart';

part 'project_analyzer_models.g.dart';

@freezed
class ProjectAnalysisResponse with _$ProjectAnalysisResponse {
  const factory ProjectAnalysisResponse({
    required ProjectSummary projectSummary,
    required List<String> importantFilePaths,
  }) = _ProjectAnalysisResponse;

  factory ProjectAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectAnalysisResponseFromJson(json);
}

@freezed
class ProjectSummary with _$ProjectSummary {
  const factory ProjectSummary({
    required String projectName,
    required Technologies technologies,
    required String purpose,
    required List<String> keyFeatures,
    required String architecture,
    required List<String> targetPlatforms,
  }) = _ProjectSummary;

  factory ProjectSummary.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryFromJson(json);
}

@freezed
class Technologies with _$Technologies {
  const factory Technologies({
    required List<String> languages,
    required String framework,
    required List<String> keyLibraries,
    required String backend,
    required String database,
  }) = _Technologies;

  factory Technologies.fromJson(Map<String, dynamic> json) =>
      _$TechnologiesFromJson(json);
}

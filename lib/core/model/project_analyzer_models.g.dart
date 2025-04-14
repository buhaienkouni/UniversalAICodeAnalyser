// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_analyzer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectAnalysisResponseImpl _$$ProjectAnalysisResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectAnalysisResponseImpl(
  projectSummary: ProjectSummary.fromJson(
    json['projectSummary'] as Map<String, dynamic>,
  ),
  importantFilePaths:
      (json['importantFilePaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$$ProjectAnalysisResponseImplToJson(
  _$ProjectAnalysisResponseImpl instance,
) => <String, dynamic>{
  'projectSummary': instance.projectSummary,
  'importantFilePaths': instance.importantFilePaths,
};

_$ProjectSummaryImpl _$$ProjectSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ProjectSummaryImpl(
      projectName: json['projectName'] as String,
      technologies: Technologies.fromJson(
        json['technologies'] as Map<String, dynamic>,
      ),
      purpose: json['purpose'] as String,
      keyFeatures:
          (json['keyFeatures'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      architecture: json['architecture'] as String,
      targetPlatforms:
          (json['targetPlatforms'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$$ProjectSummaryImplToJson(
  _$ProjectSummaryImpl instance,
) => <String, dynamic>{
  'projectName': instance.projectName,
  'technologies': instance.technologies,
  'purpose': instance.purpose,
  'keyFeatures': instance.keyFeatures,
  'architecture': instance.architecture,
  'targetPlatforms': instance.targetPlatforms,
};

_$TechnologiesImpl _$$TechnologiesImplFromJson(Map<String, dynamic> json) =>
    _$TechnologiesImpl(
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      framework: json['framework'] as String,
      keyLibraries:
          (json['keyLibraries'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      backend: json['backend'] as String,
      database: json['database'] as String,
    );

Map<String, dynamic> _$$TechnologiesImplToJson(_$TechnologiesImpl instance) =>
    <String, dynamic>{
      'languages': instance.languages,
      'framework': instance.framework,
      'keyLibraries': instance.keyLibraries,
      'backend': instance.backend,
      'database': instance.database,
    };

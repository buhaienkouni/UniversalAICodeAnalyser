// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_evaluator_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectEvaluationResponseImpl _$$ProjectEvaluationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectEvaluationResponseImpl(
  evaluation: Evaluation.fromJson(json['evaluation'] as Map<String, dynamic>),
  overallRating: (json['overallRating'] as num).toDouble(),
  finalSummary: json['finalSummary'] as String,
);

Map<String, dynamic> _$$ProjectEvaluationResponseImplToJson(
  _$ProjectEvaluationResponseImpl instance,
) => <String, dynamic>{
  'evaluation': instance.evaluation,
  'overallRating': instance.overallRating,
  'finalSummary': instance.finalSummary,
};

_$EvaluationImpl _$$EvaluationImplFromJson(Map<String, dynamic> json) =>
    _$EvaluationImpl(
      suitability: EvaluationCategory.fromJson(
        json['suitability'] as Map<String, dynamic>,
      ),
      systemArchitecture: EvaluationCategory.fromJson(
        json['systemArchitecture'] as Map<String, dynamic>,
      ),
      technicalImplementation: EvaluationCategory.fromJson(
        json['technicalImplementation'] as Map<String, dynamic>,
      ),
      userExperienceInterface: EvaluationCategory.fromJson(
        json['userExperienceInterface'] as Map<String, dynamic>,
      ),
      securityPrivacy: EvaluationCategory.fromJson(
        json['securityPrivacy'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$EvaluationImplToJson(_$EvaluationImpl instance) =>
    <String, dynamic>{
      'suitability': instance.suitability,
      'systemArchitecture': instance.systemArchitecture,
      'technicalImplementation': instance.technicalImplementation,
      'userExperienceInterface': instance.userExperienceInterface,
      'securityPrivacy': instance.securityPrivacy,
    };

_$EvaluationCategoryImpl _$$EvaluationCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$EvaluationCategoryImpl(
  score: (json['score'] as num).toDouble(),
  strengths:
      (json['strengths'] as List<dynamic>).map((e) => e as String).toList(),
  areasForImprovement:
      (json['areasForImprovement'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  recommendations:
      (json['recommendations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$$EvaluationCategoryImplToJson(
  _$EvaluationCategoryImpl instance,
) => <String, dynamic>{
  'score': instance.score,
  'strengths': instance.strengths,
  'areasForImprovement': instance.areasForImprovement,
  'recommendations': instance.recommendations,
};

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_evaluator_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectEvaluationResponse _$ProjectEvaluationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProjectEvaluationResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectEvaluationResponse {
  Evaluation get evaluation => throw _privateConstructorUsedError;
  double get overallRating => throw _privateConstructorUsedError;
  String get finalSummary => throw _privateConstructorUsedError;

  /// Serializes this ProjectEvaluationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectEvaluationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectEvaluationResponseCopyWith<ProjectEvaluationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectEvaluationResponseCopyWith<$Res> {
  factory $ProjectEvaluationResponseCopyWith(
    ProjectEvaluationResponse value,
    $Res Function(ProjectEvaluationResponse) then,
  ) = _$ProjectEvaluationResponseCopyWithImpl<$Res, ProjectEvaluationResponse>;
  @useResult
  $Res call({Evaluation evaluation, double overallRating, String finalSummary});

  $EvaluationCopyWith<$Res> get evaluation;
}

/// @nodoc
class _$ProjectEvaluationResponseCopyWithImpl<
  $Res,
  $Val extends ProjectEvaluationResponse
>
    implements $ProjectEvaluationResponseCopyWith<$Res> {
  _$ProjectEvaluationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectEvaluationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evaluation = null,
    Object? overallRating = null,
    Object? finalSummary = null,
  }) {
    return _then(
      _value.copyWith(
            evaluation:
                null == evaluation
                    ? _value.evaluation
                    : evaluation // ignore: cast_nullable_to_non_nullable
                        as Evaluation,
            overallRating:
                null == overallRating
                    ? _value.overallRating
                    : overallRating // ignore: cast_nullable_to_non_nullable
                        as double,
            finalSummary:
                null == finalSummary
                    ? _value.finalSummary
                    : finalSummary // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of ProjectEvaluationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvaluationCopyWith<$Res> get evaluation {
    return $EvaluationCopyWith<$Res>(_value.evaluation, (value) {
      return _then(_value.copyWith(evaluation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectEvaluationResponseImplCopyWith<$Res>
    implements $ProjectEvaluationResponseCopyWith<$Res> {
  factory _$$ProjectEvaluationResponseImplCopyWith(
    _$ProjectEvaluationResponseImpl value,
    $Res Function(_$ProjectEvaluationResponseImpl) then,
  ) = __$$ProjectEvaluationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Evaluation evaluation, double overallRating, String finalSummary});

  @override
  $EvaluationCopyWith<$Res> get evaluation;
}

/// @nodoc
class __$$ProjectEvaluationResponseImplCopyWithImpl<$Res>
    extends
        _$ProjectEvaluationResponseCopyWithImpl<
          $Res,
          _$ProjectEvaluationResponseImpl
        >
    implements _$$ProjectEvaluationResponseImplCopyWith<$Res> {
  __$$ProjectEvaluationResponseImplCopyWithImpl(
    _$ProjectEvaluationResponseImpl _value,
    $Res Function(_$ProjectEvaluationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectEvaluationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? evaluation = null,
    Object? overallRating = null,
    Object? finalSummary = null,
  }) {
    return _then(
      _$ProjectEvaluationResponseImpl(
        evaluation:
            null == evaluation
                ? _value.evaluation
                : evaluation // ignore: cast_nullable_to_non_nullable
                    as Evaluation,
        overallRating:
            null == overallRating
                ? _value.overallRating
                : overallRating // ignore: cast_nullable_to_non_nullable
                    as double,
        finalSummary:
            null == finalSummary
                ? _value.finalSummary
                : finalSummary // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectEvaluationResponseImpl implements _ProjectEvaluationResponse {
  const _$ProjectEvaluationResponseImpl({
    required this.evaluation,
    required this.overallRating,
    required this.finalSummary,
  });

  factory _$ProjectEvaluationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectEvaluationResponseImplFromJson(json);

  @override
  final Evaluation evaluation;
  @override
  final double overallRating;
  @override
  final String finalSummary;

  @override
  String toString() {
    return 'ProjectEvaluationResponse(evaluation: $evaluation, overallRating: $overallRating, finalSummary: $finalSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEvaluationResponseImpl &&
            (identical(other.evaluation, evaluation) ||
                other.evaluation == evaluation) &&
            (identical(other.overallRating, overallRating) ||
                other.overallRating == overallRating) &&
            (identical(other.finalSummary, finalSummary) ||
                other.finalSummary == finalSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, evaluation, overallRating, finalSummary);

  /// Create a copy of ProjectEvaluationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEvaluationResponseImplCopyWith<_$ProjectEvaluationResponseImpl>
  get copyWith => __$$ProjectEvaluationResponseImplCopyWithImpl<
    _$ProjectEvaluationResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectEvaluationResponseImplToJson(this);
  }
}

abstract class _ProjectEvaluationResponse implements ProjectEvaluationResponse {
  const factory _ProjectEvaluationResponse({
    required final Evaluation evaluation,
    required final double overallRating,
    required final String finalSummary,
  }) = _$ProjectEvaluationResponseImpl;

  factory _ProjectEvaluationResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectEvaluationResponseImpl.fromJson;

  @override
  Evaluation get evaluation;
  @override
  double get overallRating;
  @override
  String get finalSummary;

  /// Create a copy of ProjectEvaluationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectEvaluationResponseImplCopyWith<_$ProjectEvaluationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) {
  return _Evaluation.fromJson(json);
}

/// @nodoc
mixin _$Evaluation {
  EvaluationCategory get suitability => throw _privateConstructorUsedError;
  EvaluationCategory get systemArchitecture =>
      throw _privateConstructorUsedError;
  EvaluationCategory get technicalImplementation =>
      throw _privateConstructorUsedError;
  EvaluationCategory get userExperienceInterface =>
      throw _privateConstructorUsedError;
  EvaluationCategory get securityPrivacy => throw _privateConstructorUsedError;

  /// Serializes this Evaluation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvaluationCopyWith<Evaluation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvaluationCopyWith<$Res> {
  factory $EvaluationCopyWith(
    Evaluation value,
    $Res Function(Evaluation) then,
  ) = _$EvaluationCopyWithImpl<$Res, Evaluation>;
  @useResult
  $Res call({
    EvaluationCategory suitability,
    EvaluationCategory systemArchitecture,
    EvaluationCategory technicalImplementation,
    EvaluationCategory userExperienceInterface,
    EvaluationCategory securityPrivacy,
  });

  $EvaluationCategoryCopyWith<$Res> get suitability;
  $EvaluationCategoryCopyWith<$Res> get systemArchitecture;
  $EvaluationCategoryCopyWith<$Res> get technicalImplementation;
  $EvaluationCategoryCopyWith<$Res> get userExperienceInterface;
  $EvaluationCategoryCopyWith<$Res> get securityPrivacy;
}

/// @nodoc
class _$EvaluationCopyWithImpl<$Res, $Val extends Evaluation>
    implements $EvaluationCopyWith<$Res> {
  _$EvaluationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suitability = null,
    Object? systemArchitecture = null,
    Object? technicalImplementation = null,
    Object? userExperienceInterface = null,
    Object? securityPrivacy = null,
  }) {
    return _then(
      _value.copyWith(
            suitability:
                null == suitability
                    ? _value.suitability
                    : suitability // ignore: cast_nullable_to_non_nullable
                        as EvaluationCategory,
            systemArchitecture:
                null == systemArchitecture
                    ? _value.systemArchitecture
                    : systemArchitecture // ignore: cast_nullable_to_non_nullable
                        as EvaluationCategory,
            technicalImplementation:
                null == technicalImplementation
                    ? _value.technicalImplementation
                    : technicalImplementation // ignore: cast_nullable_to_non_nullable
                        as EvaluationCategory,
            userExperienceInterface:
                null == userExperienceInterface
                    ? _value.userExperienceInterface
                    : userExperienceInterface // ignore: cast_nullable_to_non_nullable
                        as EvaluationCategory,
            securityPrivacy:
                null == securityPrivacy
                    ? _value.securityPrivacy
                    : securityPrivacy // ignore: cast_nullable_to_non_nullable
                        as EvaluationCategory,
          )
          as $Val,
    );
  }

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvaluationCategoryCopyWith<$Res> get suitability {
    return $EvaluationCategoryCopyWith<$Res>(_value.suitability, (value) {
      return _then(_value.copyWith(suitability: value) as $Val);
    });
  }

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvaluationCategoryCopyWith<$Res> get systemArchitecture {
    return $EvaluationCategoryCopyWith<$Res>(_value.systemArchitecture, (
      value,
    ) {
      return _then(_value.copyWith(systemArchitecture: value) as $Val);
    });
  }

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvaluationCategoryCopyWith<$Res> get technicalImplementation {
    return $EvaluationCategoryCopyWith<$Res>(_value.technicalImplementation, (
      value,
    ) {
      return _then(_value.copyWith(technicalImplementation: value) as $Val);
    });
  }

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvaluationCategoryCopyWith<$Res> get userExperienceInterface {
    return $EvaluationCategoryCopyWith<$Res>(_value.userExperienceInterface, (
      value,
    ) {
      return _then(_value.copyWith(userExperienceInterface: value) as $Val);
    });
  }

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvaluationCategoryCopyWith<$Res> get securityPrivacy {
    return $EvaluationCategoryCopyWith<$Res>(_value.securityPrivacy, (value) {
      return _then(_value.copyWith(securityPrivacy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EvaluationImplCopyWith<$Res>
    implements $EvaluationCopyWith<$Res> {
  factory _$$EvaluationImplCopyWith(
    _$EvaluationImpl value,
    $Res Function(_$EvaluationImpl) then,
  ) = __$$EvaluationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    EvaluationCategory suitability,
    EvaluationCategory systemArchitecture,
    EvaluationCategory technicalImplementation,
    EvaluationCategory userExperienceInterface,
    EvaluationCategory securityPrivacy,
  });

  @override
  $EvaluationCategoryCopyWith<$Res> get suitability;
  @override
  $EvaluationCategoryCopyWith<$Res> get systemArchitecture;
  @override
  $EvaluationCategoryCopyWith<$Res> get technicalImplementation;
  @override
  $EvaluationCategoryCopyWith<$Res> get userExperienceInterface;
  @override
  $EvaluationCategoryCopyWith<$Res> get securityPrivacy;
}

/// @nodoc
class __$$EvaluationImplCopyWithImpl<$Res>
    extends _$EvaluationCopyWithImpl<$Res, _$EvaluationImpl>
    implements _$$EvaluationImplCopyWith<$Res> {
  __$$EvaluationImplCopyWithImpl(
    _$EvaluationImpl _value,
    $Res Function(_$EvaluationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suitability = null,
    Object? systemArchitecture = null,
    Object? technicalImplementation = null,
    Object? userExperienceInterface = null,
    Object? securityPrivacy = null,
  }) {
    return _then(
      _$EvaluationImpl(
        suitability:
            null == suitability
                ? _value.suitability
                : suitability // ignore: cast_nullable_to_non_nullable
                    as EvaluationCategory,
        systemArchitecture:
            null == systemArchitecture
                ? _value.systemArchitecture
                : systemArchitecture // ignore: cast_nullable_to_non_nullable
                    as EvaluationCategory,
        technicalImplementation:
            null == technicalImplementation
                ? _value.technicalImplementation
                : technicalImplementation // ignore: cast_nullable_to_non_nullable
                    as EvaluationCategory,
        userExperienceInterface:
            null == userExperienceInterface
                ? _value.userExperienceInterface
                : userExperienceInterface // ignore: cast_nullable_to_non_nullable
                    as EvaluationCategory,
        securityPrivacy:
            null == securityPrivacy
                ? _value.securityPrivacy
                : securityPrivacy // ignore: cast_nullable_to_non_nullable
                    as EvaluationCategory,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EvaluationImpl implements _Evaluation {
  const _$EvaluationImpl({
    required this.suitability,
    required this.systemArchitecture,
    required this.technicalImplementation,
    required this.userExperienceInterface,
    required this.securityPrivacy,
  });

  factory _$EvaluationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvaluationImplFromJson(json);

  @override
  final EvaluationCategory suitability;
  @override
  final EvaluationCategory systemArchitecture;
  @override
  final EvaluationCategory technicalImplementation;
  @override
  final EvaluationCategory userExperienceInterface;
  @override
  final EvaluationCategory securityPrivacy;

  @override
  String toString() {
    return 'Evaluation(suitability: $suitability, systemArchitecture: $systemArchitecture, technicalImplementation: $technicalImplementation, userExperienceInterface: $userExperienceInterface, securityPrivacy: $securityPrivacy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvaluationImpl &&
            (identical(other.suitability, suitability) ||
                other.suitability == suitability) &&
            (identical(other.systemArchitecture, systemArchitecture) ||
                other.systemArchitecture == systemArchitecture) &&
            (identical(
                  other.technicalImplementation,
                  technicalImplementation,
                ) ||
                other.technicalImplementation == technicalImplementation) &&
            (identical(
                  other.userExperienceInterface,
                  userExperienceInterface,
                ) ||
                other.userExperienceInterface == userExperienceInterface) &&
            (identical(other.securityPrivacy, securityPrivacy) ||
                other.securityPrivacy == securityPrivacy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    suitability,
    systemArchitecture,
    technicalImplementation,
    userExperienceInterface,
    securityPrivacy,
  );

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvaluationImplCopyWith<_$EvaluationImpl> get copyWith =>
      __$$EvaluationImplCopyWithImpl<_$EvaluationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvaluationImplToJson(this);
  }
}

abstract class _Evaluation implements Evaluation {
  const factory _Evaluation({
    required final EvaluationCategory suitability,
    required final EvaluationCategory systemArchitecture,
    required final EvaluationCategory technicalImplementation,
    required final EvaluationCategory userExperienceInterface,
    required final EvaluationCategory securityPrivacy,
  }) = _$EvaluationImpl;

  factory _Evaluation.fromJson(Map<String, dynamic> json) =
      _$EvaluationImpl.fromJson;

  @override
  EvaluationCategory get suitability;
  @override
  EvaluationCategory get systemArchitecture;
  @override
  EvaluationCategory get technicalImplementation;
  @override
  EvaluationCategory get userExperienceInterface;
  @override
  EvaluationCategory get securityPrivacy;

  /// Create a copy of Evaluation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvaluationImplCopyWith<_$EvaluationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EvaluationCategory _$EvaluationCategoryFromJson(Map<String, dynamic> json) {
  return _EvaluationCategory.fromJson(json);
}

/// @nodoc
mixin _$EvaluationCategory {
  double get score => throw _privateConstructorUsedError;
  List<String> get strengths => throw _privateConstructorUsedError;
  List<String> get areasForImprovement => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;

  /// Serializes this EvaluationCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EvaluationCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvaluationCategoryCopyWith<EvaluationCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvaluationCategoryCopyWith<$Res> {
  factory $EvaluationCategoryCopyWith(
    EvaluationCategory value,
    $Res Function(EvaluationCategory) then,
  ) = _$EvaluationCategoryCopyWithImpl<$Res, EvaluationCategory>;
  @useResult
  $Res call({
    double score,
    List<String> strengths,
    List<String> areasForImprovement,
    List<String> recommendations,
  });
}

/// @nodoc
class _$EvaluationCategoryCopyWithImpl<$Res, $Val extends EvaluationCategory>
    implements $EvaluationCategoryCopyWith<$Res> {
  _$EvaluationCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EvaluationCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? strengths = null,
    Object? areasForImprovement = null,
    Object? recommendations = null,
  }) {
    return _then(
      _value.copyWith(
            score:
                null == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as double,
            strengths:
                null == strengths
                    ? _value.strengths
                    : strengths // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            areasForImprovement:
                null == areasForImprovement
                    ? _value.areasForImprovement
                    : areasForImprovement // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            recommendations:
                null == recommendations
                    ? _value.recommendations
                    : recommendations // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EvaluationCategoryImplCopyWith<$Res>
    implements $EvaluationCategoryCopyWith<$Res> {
  factory _$$EvaluationCategoryImplCopyWith(
    _$EvaluationCategoryImpl value,
    $Res Function(_$EvaluationCategoryImpl) then,
  ) = __$$EvaluationCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double score,
    List<String> strengths,
    List<String> areasForImprovement,
    List<String> recommendations,
  });
}

/// @nodoc
class __$$EvaluationCategoryImplCopyWithImpl<$Res>
    extends _$EvaluationCategoryCopyWithImpl<$Res, _$EvaluationCategoryImpl>
    implements _$$EvaluationCategoryImplCopyWith<$Res> {
  __$$EvaluationCategoryImplCopyWithImpl(
    _$EvaluationCategoryImpl _value,
    $Res Function(_$EvaluationCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EvaluationCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? strengths = null,
    Object? areasForImprovement = null,
    Object? recommendations = null,
  }) {
    return _then(
      _$EvaluationCategoryImpl(
        score:
            null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as double,
        strengths:
            null == strengths
                ? _value._strengths
                : strengths // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        areasForImprovement:
            null == areasForImprovement
                ? _value._areasForImprovement
                : areasForImprovement // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        recommendations:
            null == recommendations
                ? _value._recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EvaluationCategoryImpl implements _EvaluationCategory {
  const _$EvaluationCategoryImpl({
    required this.score,
    required final List<String> strengths,
    required final List<String> areasForImprovement,
    required final List<String> recommendations,
  }) : _strengths = strengths,
       _areasForImprovement = areasForImprovement,
       _recommendations = recommendations;

  factory _$EvaluationCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvaluationCategoryImplFromJson(json);

  @override
  final double score;
  final List<String> _strengths;
  @override
  List<String> get strengths {
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengths);
  }

  final List<String> _areasForImprovement;
  @override
  List<String> get areasForImprovement {
    if (_areasForImprovement is EqualUnmodifiableListView)
      return _areasForImprovement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areasForImprovement);
  }

  final List<String> _recommendations;
  @override
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'EvaluationCategory(score: $score, strengths: $strengths, areasForImprovement: $areasForImprovement, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvaluationCategoryImpl &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(
              other._strengths,
              _strengths,
            ) &&
            const DeepCollectionEquality().equals(
              other._areasForImprovement,
              _areasForImprovement,
            ) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    score,
    const DeepCollectionEquality().hash(_strengths),
    const DeepCollectionEquality().hash(_areasForImprovement),
    const DeepCollectionEquality().hash(_recommendations),
  );

  /// Create a copy of EvaluationCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvaluationCategoryImplCopyWith<_$EvaluationCategoryImpl> get copyWith =>
      __$$EvaluationCategoryImplCopyWithImpl<_$EvaluationCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EvaluationCategoryImplToJson(this);
  }
}

abstract class _EvaluationCategory implements EvaluationCategory {
  const factory _EvaluationCategory({
    required final double score,
    required final List<String> strengths,
    required final List<String> areasForImprovement,
    required final List<String> recommendations,
  }) = _$EvaluationCategoryImpl;

  factory _EvaluationCategory.fromJson(Map<String, dynamic> json) =
      _$EvaluationCategoryImpl.fromJson;

  @override
  double get score;
  @override
  List<String> get strengths;
  @override
  List<String> get areasForImprovement;
  @override
  List<String> get recommendations;

  /// Create a copy of EvaluationCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvaluationCategoryImplCopyWith<_$EvaluationCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

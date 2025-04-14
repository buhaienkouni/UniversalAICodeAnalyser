// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_analyzer_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectAnalysisResponse _$ProjectAnalysisResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ProjectAnalysisResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectAnalysisResponse {
  ProjectSummary get projectSummary => throw _privateConstructorUsedError;
  List<String> get importantFilePaths => throw _privateConstructorUsedError;

  /// Serializes this ProjectAnalysisResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectAnalysisResponseCopyWith<ProjectAnalysisResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectAnalysisResponseCopyWith<$Res> {
  factory $ProjectAnalysisResponseCopyWith(
    ProjectAnalysisResponse value,
    $Res Function(ProjectAnalysisResponse) then,
  ) = _$ProjectAnalysisResponseCopyWithImpl<$Res, ProjectAnalysisResponse>;
  @useResult
  $Res call({ProjectSummary projectSummary, List<String> importantFilePaths});

  $ProjectSummaryCopyWith<$Res> get projectSummary;
}

/// @nodoc
class _$ProjectAnalysisResponseCopyWithImpl<
  $Res,
  $Val extends ProjectAnalysisResponse
>
    implements $ProjectAnalysisResponseCopyWith<$Res> {
  _$ProjectAnalysisResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectSummary = null,
    Object? importantFilePaths = null,
  }) {
    return _then(
      _value.copyWith(
            projectSummary:
                null == projectSummary
                    ? _value.projectSummary
                    : projectSummary // ignore: cast_nullable_to_non_nullable
                        as ProjectSummary,
            importantFilePaths:
                null == importantFilePaths
                    ? _value.importantFilePaths
                    : importantFilePaths // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of ProjectAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectSummaryCopyWith<$Res> get projectSummary {
    return $ProjectSummaryCopyWith<$Res>(_value.projectSummary, (value) {
      return _then(_value.copyWith(projectSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectAnalysisResponseImplCopyWith<$Res>
    implements $ProjectAnalysisResponseCopyWith<$Res> {
  factory _$$ProjectAnalysisResponseImplCopyWith(
    _$ProjectAnalysisResponseImpl value,
    $Res Function(_$ProjectAnalysisResponseImpl) then,
  ) = __$$ProjectAnalysisResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectSummary projectSummary, List<String> importantFilePaths});

  @override
  $ProjectSummaryCopyWith<$Res> get projectSummary;
}

/// @nodoc
class __$$ProjectAnalysisResponseImplCopyWithImpl<$Res>
    extends
        _$ProjectAnalysisResponseCopyWithImpl<
          $Res,
          _$ProjectAnalysisResponseImpl
        >
    implements _$$ProjectAnalysisResponseImplCopyWith<$Res> {
  __$$ProjectAnalysisResponseImplCopyWithImpl(
    _$ProjectAnalysisResponseImpl _value,
    $Res Function(_$ProjectAnalysisResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectSummary = null,
    Object? importantFilePaths = null,
  }) {
    return _then(
      _$ProjectAnalysisResponseImpl(
        projectSummary:
            null == projectSummary
                ? _value.projectSummary
                : projectSummary // ignore: cast_nullable_to_non_nullable
                    as ProjectSummary,
        importantFilePaths:
            null == importantFilePaths
                ? _value._importantFilePaths
                : importantFilePaths // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectAnalysisResponseImpl implements _ProjectAnalysisResponse {
  const _$ProjectAnalysisResponseImpl({
    required this.projectSummary,
    required final List<String> importantFilePaths,
  }) : _importantFilePaths = importantFilePaths;

  factory _$ProjectAnalysisResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectAnalysisResponseImplFromJson(json);

  @override
  final ProjectSummary projectSummary;
  final List<String> _importantFilePaths;
  @override
  List<String> get importantFilePaths {
    if (_importantFilePaths is EqualUnmodifiableListView)
      return _importantFilePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_importantFilePaths);
  }

  @override
  String toString() {
    return 'ProjectAnalysisResponse(projectSummary: $projectSummary, importantFilePaths: $importantFilePaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectAnalysisResponseImpl &&
            (identical(other.projectSummary, projectSummary) ||
                other.projectSummary == projectSummary) &&
            const DeepCollectionEquality().equals(
              other._importantFilePaths,
              _importantFilePaths,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projectSummary,
    const DeepCollectionEquality().hash(_importantFilePaths),
  );

  /// Create a copy of ProjectAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectAnalysisResponseImplCopyWith<_$ProjectAnalysisResponseImpl>
  get copyWith => __$$ProjectAnalysisResponseImplCopyWithImpl<
    _$ProjectAnalysisResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectAnalysisResponseImplToJson(this);
  }
}

abstract class _ProjectAnalysisResponse implements ProjectAnalysisResponse {
  const factory _ProjectAnalysisResponse({
    required final ProjectSummary projectSummary,
    required final List<String> importantFilePaths,
  }) = _$ProjectAnalysisResponseImpl;

  factory _ProjectAnalysisResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectAnalysisResponseImpl.fromJson;

  @override
  ProjectSummary get projectSummary;
  @override
  List<String> get importantFilePaths;

  /// Create a copy of ProjectAnalysisResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectAnalysisResponseImplCopyWith<_$ProjectAnalysisResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) {
  return _ProjectSummary.fromJson(json);
}

/// @nodoc
mixin _$ProjectSummary {
  String get projectName => throw _privateConstructorUsedError;
  Technologies get technologies => throw _privateConstructorUsedError;
  String get purpose => throw _privateConstructorUsedError;
  List<String> get keyFeatures => throw _privateConstructorUsedError;
  String get architecture => throw _privateConstructorUsedError;
  List<String> get targetPlatforms => throw _privateConstructorUsedError;

  /// Serializes this ProjectSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectSummaryCopyWith<ProjectSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectSummaryCopyWith<$Res> {
  factory $ProjectSummaryCopyWith(
    ProjectSummary value,
    $Res Function(ProjectSummary) then,
  ) = _$ProjectSummaryCopyWithImpl<$Res, ProjectSummary>;
  @useResult
  $Res call({
    String projectName,
    Technologies technologies,
    String purpose,
    List<String> keyFeatures,
    String architecture,
    List<String> targetPlatforms,
  });

  $TechnologiesCopyWith<$Res> get technologies;
}

/// @nodoc
class _$ProjectSummaryCopyWithImpl<$Res, $Val extends ProjectSummary>
    implements $ProjectSummaryCopyWith<$Res> {
  _$ProjectSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? technologies = null,
    Object? purpose = null,
    Object? keyFeatures = null,
    Object? architecture = null,
    Object? targetPlatforms = null,
  }) {
    return _then(
      _value.copyWith(
            projectName:
                null == projectName
                    ? _value.projectName
                    : projectName // ignore: cast_nullable_to_non_nullable
                        as String,
            technologies:
                null == technologies
                    ? _value.technologies
                    : technologies // ignore: cast_nullable_to_non_nullable
                        as Technologies,
            purpose:
                null == purpose
                    ? _value.purpose
                    : purpose // ignore: cast_nullable_to_non_nullable
                        as String,
            keyFeatures:
                null == keyFeatures
                    ? _value.keyFeatures
                    : keyFeatures // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            architecture:
                null == architecture
                    ? _value.architecture
                    : architecture // ignore: cast_nullable_to_non_nullable
                        as String,
            targetPlatforms:
                null == targetPlatforms
                    ? _value.targetPlatforms
                    : targetPlatforms // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TechnologiesCopyWith<$Res> get technologies {
    return $TechnologiesCopyWith<$Res>(_value.technologies, (value) {
      return _then(_value.copyWith(technologies: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectSummaryImplCopyWith<$Res>
    implements $ProjectSummaryCopyWith<$Res> {
  factory _$$ProjectSummaryImplCopyWith(
    _$ProjectSummaryImpl value,
    $Res Function(_$ProjectSummaryImpl) then,
  ) = __$$ProjectSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String projectName,
    Technologies technologies,
    String purpose,
    List<String> keyFeatures,
    String architecture,
    List<String> targetPlatforms,
  });

  @override
  $TechnologiesCopyWith<$Res> get technologies;
}

/// @nodoc
class __$$ProjectSummaryImplCopyWithImpl<$Res>
    extends _$ProjectSummaryCopyWithImpl<$Res, _$ProjectSummaryImpl>
    implements _$$ProjectSummaryImplCopyWith<$Res> {
  __$$ProjectSummaryImplCopyWithImpl(
    _$ProjectSummaryImpl _value,
    $Res Function(_$ProjectSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? technologies = null,
    Object? purpose = null,
    Object? keyFeatures = null,
    Object? architecture = null,
    Object? targetPlatforms = null,
  }) {
    return _then(
      _$ProjectSummaryImpl(
        projectName:
            null == projectName
                ? _value.projectName
                : projectName // ignore: cast_nullable_to_non_nullable
                    as String,
        technologies:
            null == technologies
                ? _value.technologies
                : technologies // ignore: cast_nullable_to_non_nullable
                    as Technologies,
        purpose:
            null == purpose
                ? _value.purpose
                : purpose // ignore: cast_nullable_to_non_nullable
                    as String,
        keyFeatures:
            null == keyFeatures
                ? _value._keyFeatures
                : keyFeatures // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        architecture:
            null == architecture
                ? _value.architecture
                : architecture // ignore: cast_nullable_to_non_nullable
                    as String,
        targetPlatforms:
            null == targetPlatforms
                ? _value._targetPlatforms
                : targetPlatforms // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectSummaryImpl implements _ProjectSummary {
  const _$ProjectSummaryImpl({
    required this.projectName,
    required this.technologies,
    required this.purpose,
    required final List<String> keyFeatures,
    required this.architecture,
    required final List<String> targetPlatforms,
  }) : _keyFeatures = keyFeatures,
       _targetPlatforms = targetPlatforms;

  factory _$ProjectSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectSummaryImplFromJson(json);

  @override
  final String projectName;
  @override
  final Technologies technologies;
  @override
  final String purpose;
  final List<String> _keyFeatures;
  @override
  List<String> get keyFeatures {
    if (_keyFeatures is EqualUnmodifiableListView) return _keyFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyFeatures);
  }

  @override
  final String architecture;
  final List<String> _targetPlatforms;
  @override
  List<String> get targetPlatforms {
    if (_targetPlatforms is EqualUnmodifiableListView) return _targetPlatforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetPlatforms);
  }

  @override
  String toString() {
    return 'ProjectSummary(projectName: $projectName, technologies: $technologies, purpose: $purpose, keyFeatures: $keyFeatures, architecture: $architecture, targetPlatforms: $targetPlatforms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectSummaryImpl &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.technologies, technologies) ||
                other.technologies == technologies) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            const DeepCollectionEquality().equals(
              other._keyFeatures,
              _keyFeatures,
            ) &&
            (identical(other.architecture, architecture) ||
                other.architecture == architecture) &&
            const DeepCollectionEquality().equals(
              other._targetPlatforms,
              _targetPlatforms,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projectName,
    technologies,
    purpose,
    const DeepCollectionEquality().hash(_keyFeatures),
    architecture,
    const DeepCollectionEquality().hash(_targetPlatforms),
  );

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectSummaryImplCopyWith<_$ProjectSummaryImpl> get copyWith =>
      __$$ProjectSummaryImplCopyWithImpl<_$ProjectSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectSummaryImplToJson(this);
  }
}

abstract class _ProjectSummary implements ProjectSummary {
  const factory _ProjectSummary({
    required final String projectName,
    required final Technologies technologies,
    required final String purpose,
    required final List<String> keyFeatures,
    required final String architecture,
    required final List<String> targetPlatforms,
  }) = _$ProjectSummaryImpl;

  factory _ProjectSummary.fromJson(Map<String, dynamic> json) =
      _$ProjectSummaryImpl.fromJson;

  @override
  String get projectName;
  @override
  Technologies get technologies;
  @override
  String get purpose;
  @override
  List<String> get keyFeatures;
  @override
  String get architecture;
  @override
  List<String> get targetPlatforms;

  /// Create a copy of ProjectSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectSummaryImplCopyWith<_$ProjectSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Technologies _$TechnologiesFromJson(Map<String, dynamic> json) {
  return _Technologies.fromJson(json);
}

/// @nodoc
mixin _$Technologies {
  List<String> get languages => throw _privateConstructorUsedError;
  String get framework => throw _privateConstructorUsedError;
  List<String> get keyLibraries => throw _privateConstructorUsedError;
  String get backend => throw _privateConstructorUsedError;
  String get database => throw _privateConstructorUsedError;

  /// Serializes this Technologies to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Technologies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TechnologiesCopyWith<Technologies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnologiesCopyWith<$Res> {
  factory $TechnologiesCopyWith(
    Technologies value,
    $Res Function(Technologies) then,
  ) = _$TechnologiesCopyWithImpl<$Res, Technologies>;
  @useResult
  $Res call({
    List<String> languages,
    String framework,
    List<String> keyLibraries,
    String backend,
    String database,
  });
}

/// @nodoc
class _$TechnologiesCopyWithImpl<$Res, $Val extends Technologies>
    implements $TechnologiesCopyWith<$Res> {
  _$TechnologiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Technologies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = null,
    Object? framework = null,
    Object? keyLibraries = null,
    Object? backend = null,
    Object? database = null,
  }) {
    return _then(
      _value.copyWith(
            languages:
                null == languages
                    ? _value.languages
                    : languages // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            framework:
                null == framework
                    ? _value.framework
                    : framework // ignore: cast_nullable_to_non_nullable
                        as String,
            keyLibraries:
                null == keyLibraries
                    ? _value.keyLibraries
                    : keyLibraries // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            backend:
                null == backend
                    ? _value.backend
                    : backend // ignore: cast_nullable_to_non_nullable
                        as String,
            database:
                null == database
                    ? _value.database
                    : database // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TechnologiesImplCopyWith<$Res>
    implements $TechnologiesCopyWith<$Res> {
  factory _$$TechnologiesImplCopyWith(
    _$TechnologiesImpl value,
    $Res Function(_$TechnologiesImpl) then,
  ) = __$$TechnologiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> languages,
    String framework,
    List<String> keyLibraries,
    String backend,
    String database,
  });
}

/// @nodoc
class __$$TechnologiesImplCopyWithImpl<$Res>
    extends _$TechnologiesCopyWithImpl<$Res, _$TechnologiesImpl>
    implements _$$TechnologiesImplCopyWith<$Res> {
  __$$TechnologiesImplCopyWithImpl(
    _$TechnologiesImpl _value,
    $Res Function(_$TechnologiesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Technologies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = null,
    Object? framework = null,
    Object? keyLibraries = null,
    Object? backend = null,
    Object? database = null,
  }) {
    return _then(
      _$TechnologiesImpl(
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        framework:
            null == framework
                ? _value.framework
                : framework // ignore: cast_nullable_to_non_nullable
                    as String,
        keyLibraries:
            null == keyLibraries
                ? _value._keyLibraries
                : keyLibraries // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        backend:
            null == backend
                ? _value.backend
                : backend // ignore: cast_nullable_to_non_nullable
                    as String,
        database:
            null == database
                ? _value.database
                : database // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TechnologiesImpl implements _Technologies {
  const _$TechnologiesImpl({
    required final List<String> languages,
    required this.framework,
    required final List<String> keyLibraries,
    required this.backend,
    required this.database,
  }) : _languages = languages,
       _keyLibraries = keyLibraries;

  factory _$TechnologiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TechnologiesImplFromJson(json);

  final List<String> _languages;
  @override
  List<String> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  final String framework;
  final List<String> _keyLibraries;
  @override
  List<String> get keyLibraries {
    if (_keyLibraries is EqualUnmodifiableListView) return _keyLibraries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyLibraries);
  }

  @override
  final String backend;
  @override
  final String database;

  @override
  String toString() {
    return 'Technologies(languages: $languages, framework: $framework, keyLibraries: $keyLibraries, backend: $backend, database: $database)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TechnologiesImpl &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.framework, framework) ||
                other.framework == framework) &&
            const DeepCollectionEquality().equals(
              other._keyLibraries,
              _keyLibraries,
            ) &&
            (identical(other.backend, backend) || other.backend == backend) &&
            (identical(other.database, database) ||
                other.database == database));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_languages),
    framework,
    const DeepCollectionEquality().hash(_keyLibraries),
    backend,
    database,
  );

  /// Create a copy of Technologies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TechnologiesImplCopyWith<_$TechnologiesImpl> get copyWith =>
      __$$TechnologiesImplCopyWithImpl<_$TechnologiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TechnologiesImplToJson(this);
  }
}

abstract class _Technologies implements Technologies {
  const factory _Technologies({
    required final List<String> languages,
    required final String framework,
    required final List<String> keyLibraries,
    required final String backend,
    required final String database,
  }) = _$TechnologiesImpl;

  factory _Technologies.fromJson(Map<String, dynamic> json) =
      _$TechnologiesImpl.fromJson;

  @override
  List<String> get languages;
  @override
  String get framework;
  @override
  List<String> get keyLibraries;
  @override
  String get backend;
  @override
  String get database;

  /// Create a copy of Technologies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TechnologiesImplCopyWith<_$TechnologiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeEntryModel _$TimeEntryModelFromJson(Map<String, dynamic> json) {
  return _TimeEntryModel.fromJson(json);
}

/// @nodoc
mixin _$TimeEntryModel {
  String? get workspaceId => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start')
  String? get startDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end')
  String? get endDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeEntryModelCopyWith<TimeEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeEntryModelCopyWith<$Res> {
  factory $TimeEntryModelCopyWith(
          TimeEntryModel value, $Res Function(TimeEntryModel) then) =
      _$TimeEntryModelCopyWithImpl<$Res>;
  $Res call(
      {String? workspaceId,
      String? projectId,
      String? description,
      String? taskId,
      @JsonKey(name: 'start') String? startDateTime,
      @JsonKey(name: 'end') String? endDateTime});
}

/// @nodoc
class _$TimeEntryModelCopyWithImpl<$Res>
    implements $TimeEntryModelCopyWith<$Res> {
  _$TimeEntryModelCopyWithImpl(this._value, this._then);

  final TimeEntryModel _value;
  // ignore: unused_field
  final $Res Function(TimeEntryModel) _then;

  @override
  $Res call({
    Object? workspaceId = freezed,
    Object? projectId = freezed,
    Object? description = freezed,
    Object? taskId = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      workspaceId: workspaceId == freezed
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endDateTime: endDateTime == freezed
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TimeEntryModelCopyWith<$Res>
    implements $TimeEntryModelCopyWith<$Res> {
  factory _$$_TimeEntryModelCopyWith(
          _$_TimeEntryModel value, $Res Function(_$_TimeEntryModel) then) =
      __$$_TimeEntryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? workspaceId,
      String? projectId,
      String? description,
      String? taskId,
      @JsonKey(name: 'start') String? startDateTime,
      @JsonKey(name: 'end') String? endDateTime});
}

/// @nodoc
class __$$_TimeEntryModelCopyWithImpl<$Res>
    extends _$TimeEntryModelCopyWithImpl<$Res>
    implements _$$_TimeEntryModelCopyWith<$Res> {
  __$$_TimeEntryModelCopyWithImpl(
      _$_TimeEntryModel _value, $Res Function(_$_TimeEntryModel) _then)
      : super(_value, (v) => _then(v as _$_TimeEntryModel));

  @override
  _$_TimeEntryModel get _value => super._value as _$_TimeEntryModel;

  @override
  $Res call({
    Object? workspaceId = freezed,
    Object? projectId = freezed,
    Object? description = freezed,
    Object? taskId = freezed,
    Object? startDateTime = freezed,
    Object? endDateTime = freezed,
  }) {
    return _then(_$_TimeEntryModel(
      workspaceId: workspaceId == freezed
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: startDateTime == freezed
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endDateTime: endDateTime == freezed
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeEntryModel implements _TimeEntryModel {
  _$_TimeEntryModel(
      {this.workspaceId,
      this.projectId,
      this.description,
      this.taskId,
      @JsonKey(name: 'start') this.startDateTime,
      @JsonKey(name: 'end') this.endDateTime});

  factory _$_TimeEntryModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimeEntryModelFromJson(json);

  @override
  final String? workspaceId;
  @override
  final String? projectId;
  @override
  final String? description;
  @override
  final String? taskId;
  @override
  @JsonKey(name: 'start')
  final String? startDateTime;
  @override
  @JsonKey(name: 'end')
  final String? endDateTime;

  @override
  String toString() {
    return 'TimeEntryModel(workspaceId: $workspaceId, projectId: $projectId, description: $description, taskId: $taskId, startDateTime: $startDateTime, endDateTime: $endDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeEntryModel &&
            const DeepCollectionEquality()
                .equals(other.workspaceId, workspaceId) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality()
                .equals(other.startDateTime, startDateTime) &&
            const DeepCollectionEquality()
                .equals(other.endDateTime, endDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(workspaceId),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(startDateTime),
      const DeepCollectionEquality().hash(endDateTime));

  @JsonKey(ignore: true)
  @override
  _$$_TimeEntryModelCopyWith<_$_TimeEntryModel> get copyWith =>
      __$$_TimeEntryModelCopyWithImpl<_$_TimeEntryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeEntryModelToJson(
      this,
    );
  }
}

abstract class _TimeEntryModel implements TimeEntryModel {
  factory _TimeEntryModel(
      {final String? workspaceId,
      final String? projectId,
      final String? description,
      final String? taskId,
      @JsonKey(name: 'start') final String? startDateTime,
      @JsonKey(name: 'end') final String? endDateTime}) = _$_TimeEntryModel;

  factory _TimeEntryModel.fromJson(Map<String, dynamic> json) =
      _$_TimeEntryModel.fromJson;

  @override
  String? get workspaceId;
  @override
  String? get projectId;
  @override
  String? get description;
  @override
  String? get taskId;
  @override
  @JsonKey(name: 'start')
  String? get startDateTime;
  @override
  @JsonKey(name: 'end')
  String? get endDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_TimeEntryModelCopyWith<_$_TimeEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeModel _$TimeModelFromJson(Map<String, dynamic> json) {
  return _TimeModel.fromJson(json);
}

/// @nodoc
mixin _$TimeModel {
  String? get workspaceId => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  String? get taskId => throw _privateConstructorUsedError;
  String? get startData => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeModelCopyWith<TimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeModelCopyWith<$Res> {
  factory $TimeModelCopyWith(TimeModel value, $Res Function(TimeModel) then) =
      _$TimeModelCopyWithImpl<$Res>;
  $Res call(
      {String? workspaceId,
      String? projectId,
      String? taskId,
      String? startData,
      String? endDate});
}

/// @nodoc
class _$TimeModelCopyWithImpl<$Res> implements $TimeModelCopyWith<$Res> {
  _$TimeModelCopyWithImpl(this._value, this._then);

  final TimeModel _value;
  // ignore: unused_field
  final $Res Function(TimeModel) _then;

  @override
  $Res call({
    Object? workspaceId = freezed,
    Object? projectId = freezed,
    Object? taskId = freezed,
    Object? startData = freezed,
    Object? endDate = freezed,
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
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      startData: startData == freezed
          ? _value.startData
          : startData // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TimeModelCopyWith<$Res> implements $TimeModelCopyWith<$Res> {
  factory _$$_TimeModelCopyWith(
          _$_TimeModel value, $Res Function(_$_TimeModel) then) =
      __$$_TimeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? workspaceId,
      String? projectId,
      String? taskId,
      String? startData,
      String? endDate});
}

/// @nodoc
class __$$_TimeModelCopyWithImpl<$Res> extends _$TimeModelCopyWithImpl<$Res>
    implements _$$_TimeModelCopyWith<$Res> {
  __$$_TimeModelCopyWithImpl(
      _$_TimeModel _value, $Res Function(_$_TimeModel) _then)
      : super(_value, (v) => _then(v as _$_TimeModel));

  @override
  _$_TimeModel get _value => super._value as _$_TimeModel;

  @override
  $Res call({
    Object? workspaceId = freezed,
    Object? projectId = freezed,
    Object? taskId = freezed,
    Object? startData = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_TimeModel(
      workspaceId: workspaceId == freezed
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      startData: startData == freezed
          ? _value.startData
          : startData // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeModel implements _TimeModel {
  _$_TimeModel(
      {this.workspaceId,
      this.projectId,
      this.taskId,
      this.startData,
      this.endDate});

  factory _$_TimeModel.fromJson(Map<String, dynamic> json) =>
      _$$_TimeModelFromJson(json);

  @override
  final String? workspaceId;
  @override
  final String? projectId;
  @override
  final String? taskId;
  @override
  final String? startData;
  @override
  final String? endDate;

  @override
  String toString() {
    return 'TimeModel(workspaceId: $workspaceId, projectId: $projectId, taskId: $taskId, startData: $startData, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeModel &&
            const DeepCollectionEquality()
                .equals(other.workspaceId, workspaceId) &&
            const DeepCollectionEquality().equals(other.projectId, projectId) &&
            const DeepCollectionEquality().equals(other.taskId, taskId) &&
            const DeepCollectionEquality().equals(other.startData, startData) &&
            const DeepCollectionEquality().equals(other.endDate, endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(workspaceId),
      const DeepCollectionEquality().hash(projectId),
      const DeepCollectionEquality().hash(taskId),
      const DeepCollectionEquality().hash(startData),
      const DeepCollectionEquality().hash(endDate));

  @JsonKey(ignore: true)
  @override
  _$$_TimeModelCopyWith<_$_TimeModel> get copyWith =>
      __$$_TimeModelCopyWithImpl<_$_TimeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeModelToJson(
      this,
    );
  }
}

abstract class _TimeModel implements TimeModel {
  factory _TimeModel(
      {final String? workspaceId,
      final String? projectId,
      final String? taskId,
      final String? startData,
      final String? endDate}) = _$_TimeModel;

  factory _TimeModel.fromJson(Map<String, dynamic> json) =
      _$_TimeModel.fromJson;

  @override
  String? get workspaceId;
  @override
  String? get projectId;
  @override
  String? get taskId;
  @override
  String? get startData;
  @override
  String? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_TimeModelCopyWith<_$_TimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserWorkspaceInfoModel _$UserWorkspaceInfoModelFromJson(
    Map<String, dynamic> json) {
  return _UserWorkspaceInfoModel.fromJson(json);
}

/// @nodoc
mixin _$UserWorkspaceInfoModel {
  @JsonKey(name: 'id')
  String? get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'activeWorkspace')
  String? get activeWorkspaceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWorkspaceInfoModelCopyWith<UserWorkspaceInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWorkspaceInfoModelCopyWith<$Res> {
  factory $UserWorkspaceInfoModelCopyWith(UserWorkspaceInfoModel value,
          $Res Function(UserWorkspaceInfoModel) then) =
      _$UserWorkspaceInfoModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? userId,
      String? name,
      String? email,
      @JsonKey(name: 'activeWorkspace') String? activeWorkspaceId});
}

/// @nodoc
class _$UserWorkspaceInfoModelCopyWithImpl<$Res>
    implements $UserWorkspaceInfoModelCopyWith<$Res> {
  _$UserWorkspaceInfoModelCopyWithImpl(this._value, this._then);

  final UserWorkspaceInfoModel _value;
  // ignore: unused_field
  final $Res Function(UserWorkspaceInfoModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? activeWorkspaceId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      activeWorkspaceId: activeWorkspaceId == freezed
          ? _value.activeWorkspaceId
          : activeWorkspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserWorkspaceInfoModelCopyWith<$Res>
    implements $UserWorkspaceInfoModelCopyWith<$Res> {
  factory _$$_UserWorkspaceInfoModelCopyWith(_$_UserWorkspaceInfoModel value,
          $Res Function(_$_UserWorkspaceInfoModel) then) =
      __$$_UserWorkspaceInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? userId,
      String? name,
      String? email,
      @JsonKey(name: 'activeWorkspace') String? activeWorkspaceId});
}

/// @nodoc
class __$$_UserWorkspaceInfoModelCopyWithImpl<$Res>
    extends _$UserWorkspaceInfoModelCopyWithImpl<$Res>
    implements _$$_UserWorkspaceInfoModelCopyWith<$Res> {
  __$$_UserWorkspaceInfoModelCopyWithImpl(_$_UserWorkspaceInfoModel _value,
      $Res Function(_$_UserWorkspaceInfoModel) _then)
      : super(_value, (v) => _then(v as _$_UserWorkspaceInfoModel));

  @override
  _$_UserWorkspaceInfoModel get _value =>
      super._value as _$_UserWorkspaceInfoModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? activeWorkspaceId = freezed,
  }) {
    return _then(_$_UserWorkspaceInfoModel(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      activeWorkspaceId: activeWorkspaceId == freezed
          ? _value.activeWorkspaceId
          : activeWorkspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserWorkspaceInfoModel implements _UserWorkspaceInfoModel {
  _$_UserWorkspaceInfoModel(
      {@JsonKey(name: 'id') this.userId,
      this.name,
      this.email,
      @JsonKey(name: 'activeWorkspace') this.activeWorkspaceId});

  factory _$_UserWorkspaceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserWorkspaceInfoModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? userId;
  @override
  final String? name;
  @override
  final String? email;
  @override
  @JsonKey(name: 'activeWorkspace')
  final String? activeWorkspaceId;

  @override
  String toString() {
    return 'UserWorkspaceInfoModel(userId: $userId, name: $name, email: $email, activeWorkspaceId: $activeWorkspaceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserWorkspaceInfoModel &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.activeWorkspaceId, activeWorkspaceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(activeWorkspaceId));

  @JsonKey(ignore: true)
  @override
  _$$_UserWorkspaceInfoModelCopyWith<_$_UserWorkspaceInfoModel> get copyWith =>
      __$$_UserWorkspaceInfoModelCopyWithImpl<_$_UserWorkspaceInfoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserWorkspaceInfoModelToJson(
      this,
    );
  }
}

abstract class _UserWorkspaceInfoModel implements UserWorkspaceInfoModel {
  factory _UserWorkspaceInfoModel(
          {@JsonKey(name: 'id') final String? userId,
          final String? name,
          final String? email,
          @JsonKey(name: 'activeWorkspace') final String? activeWorkspaceId}) =
      _$_UserWorkspaceInfoModel;

  factory _UserWorkspaceInfoModel.fromJson(Map<String, dynamic> json) =
      _$_UserWorkspaceInfoModel.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get userId;
  @override
  String? get name;
  @override
  String? get email;
  @override
  @JsonKey(name: 'activeWorkspace')
  String? get activeWorkspaceId;
  @override
  @JsonKey(ignore: true)
  _$$_UserWorkspaceInfoModelCopyWith<_$_UserWorkspaceInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

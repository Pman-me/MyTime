// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkspaceModel _$WorkspaceModelFromJson(Map<String, dynamic> json) {
  return _WorkspaceModel.fromJson(json);
}

/// @nodoc
mixin _$WorkspaceModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceModelCopyWith<WorkspaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceModelCopyWith<$Res> {
  factory $WorkspaceModelCopyWith(
          WorkspaceModel value, $Res Function(WorkspaceModel) then) =
      _$WorkspaceModelCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? imageUrl});
}

/// @nodoc
class _$WorkspaceModelCopyWithImpl<$Res>
    implements $WorkspaceModelCopyWith<$Res> {
  _$WorkspaceModelCopyWithImpl(this._value, this._then);

  final WorkspaceModel _value;
  // ignore: unused_field
  final $Res Function(WorkspaceModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkspaceModelCopyWith<$Res>
    implements $WorkspaceModelCopyWith<$Res> {
  factory _$$_WorkspaceModelCopyWith(
          _$_WorkspaceModel value, $Res Function(_$_WorkspaceModel) then) =
      __$$_WorkspaceModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? imageUrl});
}

/// @nodoc
class __$$_WorkspaceModelCopyWithImpl<$Res>
    extends _$WorkspaceModelCopyWithImpl<$Res>
    implements _$$_WorkspaceModelCopyWith<$Res> {
  __$$_WorkspaceModelCopyWithImpl(
      _$_WorkspaceModel _value, $Res Function(_$_WorkspaceModel) _then)
      : super(_value, (v) => _then(v as _$_WorkspaceModel));

  @override
  _$_WorkspaceModel get _value => super._value as _$_WorkspaceModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_WorkspaceModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkspaceModel implements _WorkspaceModel {
  _$_WorkspaceModel({this.id, this.name, this.imageUrl});

  factory _$_WorkspaceModel.fromJson(Map<String, dynamic> json) =>
      _$$_WorkspaceModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'WorkspaceModel(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkspaceModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_WorkspaceModelCopyWith<_$_WorkspaceModel> get copyWith =>
      __$$_WorkspaceModelCopyWithImpl<_$_WorkspaceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkspaceModelToJson(
      this,
    );
  }
}

abstract class _WorkspaceModel implements WorkspaceModel {
  factory _WorkspaceModel(
      {final String? id,
      final String? name,
      final String? imageUrl}) = _$_WorkspaceModel;

  factory _WorkspaceModel.fromJson(Map<String, dynamic> json) =
      _$_WorkspaceModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceModelCopyWith<_$_WorkspaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

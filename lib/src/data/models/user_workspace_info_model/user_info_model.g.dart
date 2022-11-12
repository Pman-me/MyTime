// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserWorkspaceInfoModel _$$_UserWorkspaceInfoModelFromJson(
        Map<String, dynamic> json) =>
    _$_UserWorkspaceInfoModel(
      userId: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      activeWorkspaceId: json['activeWorkspace'] as String?,
    );

Map<String, dynamic> _$$_UserWorkspaceInfoModelToJson(
        _$_UserWorkspaceInfoModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'activeWorkspace': instance.activeWorkspaceId,
    };

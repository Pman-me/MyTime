// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeModel _$$_TimeModelFromJson(Map<String, dynamic> json) => _$_TimeModel(
      workspaceId: json['workspaceId'] as String?,
      projectId: json['projectId'] as String?,
      taskId: json['taskId'] as String?,
      startData: json['startData'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$$_TimeModelToJson(_$_TimeModel instance) =>
    <String, dynamic>{
      'workspaceId': instance.workspaceId,
      'projectId': instance.projectId,
      'taskId': instance.taskId,
      'startData': instance.startData,
      'endDate': instance.endDate,
    };

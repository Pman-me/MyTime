// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeEntryModel _$$_TimeEntryModelFromJson(Map<String, dynamic> json) =>
    _$_TimeEntryModel(
      workspaceId: json['workspaceId'] as String?,
      projectId: json['projectId'] as String?,
      description: json['description'] as String?,
      taskId: json['taskId'] as String?,
      startDateTime: json['start'] as String?,
      endDateTime: json['end'] as String?,
    );

Map<String, dynamic> _$$_TimeEntryModelToJson(_$_TimeEntryModel instance) =>
    <String, dynamic>{
      'workspaceId': instance.workspaceId,
      'projectId': instance.projectId,
      'description': instance.description,
      'taskId': instance.taskId,
      'start': instance.startDateTime,
      'end': instance.endDateTime,
    };

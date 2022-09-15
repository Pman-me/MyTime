import 'package:equatable/equatable.dart';

class TimeEntity extends Equatable {
  final String? id;
  final String? name;
  final String? workspaceId;
  final String? projectId;
  final String? taskId;
  final String? startData;
  final String? endDate;

  const TimeEntity(
      {this.id,
      this.name,
      this.workspaceId,
      this.projectId,
      this.taskId,
      this.startData,
      this.endDate});

  @override
  List<Object?> get props =>
      [id, name, workspaceId, projectId, taskId, startData, endDate];
}

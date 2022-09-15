import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String? id;
  final String? name;
  final String? clientId;
  final String? workspaceId;

  const ProjectEntity({this.id, this.name, this.workspaceId, this.clientId});

  @override
  List<Object?> get props => [id, name, clientId, workspaceId];
}

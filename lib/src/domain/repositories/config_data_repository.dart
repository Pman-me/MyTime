import 'package:my_time/src/domain/entities/project_enity.dart';
import 'package:my_time/src/domain/entities/task_entity.dart';
import 'package:my_time/src/domain/entities/workspace_entity.dart';

abstract class IConfigDataRepository{
  Future<List<WorkspaceEntity>> getWorkspaces();
  Future<List<ProjectEntity>> getProjects(String workspaceId);
  Future<List<TaskEntity>> getTasks(String workspaceId,String projectId);
}
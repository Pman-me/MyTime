import 'package:my_time/src/data/config_data/config_remote_data_source.dart';
import 'package:my_time/src/domain/entities/project_enity.dart';
import 'package:my_time/src/domain/entities/task_entity.dart';
import 'package:my_time/src/domain/entities/workspace_entity.dart';

import '../../domain/repositories/config_data_repository.dart';
import '../models/project_model/project_model.dart';
import '../models/task_model/task_model.dart';
import '../models/workspace_model/workspace_model.dart';

class ConfigDataRepositoryImpl extends IConfigDataRepository {
  ConfigDataRepositoryImpl({required this.configRemoteDataSource});

  ConfigRemoteDataSource configRemoteDataSource;

  @override
  Future<List<ProjectEntity>> getProjects(String workspaceId) async {
    final projectsResponse = await configRemoteDataSource.getProjects(workspaceId);

    List<ProjectEntity> projects = [];
    for (var json in (projectsResponse.body as List)) {
      var projectModel = ProjectModel.fromJson(json);
      projects.add(ProjectEntity(
          id: projectModel.id,
          name: projectModel.name,
          workspaceId: projectModel.workspaceId,
          clientId: projectModel.clientId));
    }
    return projects;
  }

  @override
  Future<List<TaskEntity>> getTasks(String workspaceId, String projectId) async {
    final tasksResponse = await configRemoteDataSource.getTasks(
        workspaceId, projectId);

    List<TaskEntity> tasks = [];
    for (var json in (tasksResponse.body as List)) {
      var taskModel = TaskModel.fromJson(json);
      tasks.add(TaskEntity(id: taskModel.id,name: taskModel.name,projectId: taskModel.projectId));
    }
    return tasks;
  }

  @override
  Future<List<WorkspaceEntity>> getWorkspaces() async {
    final workSpacesResponse = await configRemoteDataSource.getWorkspaces();
    List<WorkspaceEntity> workspaces = [];
    for (var json in (workSpacesResponse.body as List)) {
      var workspaceModel = WorkspaceModel.fromJson(json);
      workspaces.add(WorkspaceEntity(
          id: workspaceModel.id,
          name: workspaceModel.name,
          imageUrl: workspaceModel.imageUrl));
    }
    return workspaces;
  }
}

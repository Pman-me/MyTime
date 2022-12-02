import 'package:my_time/src/data/local/app_db/object_box_helper.dart';
import 'package:my_time/src/data/models/time__entry_model/time_entry_model.dart';
import 'package:my_time/src/domain/entities/project_entity.dart';
import 'package:my_time/src/domain/entities/task_entity.dart';
import 'package:my_time/src/domain/entities/time_entry_entity.dart';
import 'package:my_time/src/domain/entities/user_workspace_info_entity.dart';
import 'package:my_time/src/domain/entities/workspace_entity.dart';
import 'package:my_time/src/domain/repositories/main_repo.dart';
import 'package:my_time/src/exceptions/failure.dart';
import 'package:my_time/src/exceptions/no_internet_exception.dart';

import '../data_sources/remote_data_source_impl.dart';
import '../models/project_model/project_model.dart';
import '../models/task_model/task_model.dart';
import '../models/user_workspace_info_model/user_info_model.dart';
import '../models/workspace_model/workspace_model.dart';

class MainRepo implements IMainRepo {
  RemoteDataSourceImpl _remoteDataSource;
  ObjectBoxHelper _objectBoxHelper;

  MainRepo(
      {required RemoteDataSourceImpl remoteDataSource,
      required ObjectBoxHelper objectBoxHelper})
      : _remoteDataSource = remoteDataSource,
        _objectBoxHelper = objectBoxHelper;

  @override
  Future<List<WorkspaceEntity>> fetchWorkspaces() async {
    List<WorkspaceEntity> workspaces = [];

    if (_objectBoxHelper.isWorkspaceBoxEmpty()) {
      final workSpacesResponse = await _remoteDataSource.fetchWorkspaces();
      for (var json in (workSpacesResponse.body as List)) {
        var workspaceModel = WorkspaceModel.fromJson(json);
        workspaces.add(WorkspaceEntity(
            id: workspaceModel.id,
            name: workspaceModel.name,
            imageUrl: workspaceModel.imageUrl));
      }
      _objectBoxHelper.putWorkspaces(workspaces);
    } else {
      workspaces = _objectBoxHelper.fetchWorkspaces();
    }

    return workspaces;
  }

  @override
  Future<List<ProjectEntity>> fetchProjects({required String workspaceId}) async {
    List<ProjectEntity> projects = [];

    if (_objectBoxHelper.isProjectBoxEmpty()) {
      final projectsResponse = await _remoteDataSource.fetchProjects(workspaceId);

      for (var json in (projectsResponse.body as List)) {
        var projectModel = ProjectModel.fromJson(json);
        projects.add(ProjectEntity(
            id: projectModel.id,
            name: projectModel.name,
            workspaceId: projectModel.workspaceId,
            clientId: projectModel.clientId));
      }
      _objectBoxHelper.putProjects(projects);
    } else {
      projects = _objectBoxHelper.fetchProjects();
    }

    return projects;
  }

  @override
  Future<List<TaskEntity>> fetchTasks(
      {required String workspaceId, required String projectId}) async {
    List<TaskEntity> tasks = [];

    if (_objectBoxHelper.isTaskBoxEmpty()) {
      final tasksResponse = await _remoteDataSource.fetchTasks(workspaceId, projectId);

      for (var json in (tasksResponse.body as List)) {
        var taskModel = TaskModel.fromJson(json);
        tasks.add(TaskEntity(
            id: taskModel.id, name: taskModel.name, projectId: taskModel.projectId));
      }
      _objectBoxHelper.putTasks(tasks);
    } else {
      tasks = _objectBoxHelper.fetchTasks();
    }

    return tasks;
  }

  @override
  List<TimeEntryEntity> fetchTimeEntries() {
    return _objectBoxHelper.fetchTimeEntries();
  }

  @override
  Future<UserWorkspaceInfoEntity> fetchLastTimeEntryWorkspaceInfo() async {
    var newUserWorkspaceInfo;

    if (isUserWorkspaceInfoBoxEmpty()) {
      try {
        final userWorkspaceInfo = await fetchUserInfo();

        final timeEntriesResponse =
            await _remoteDataSource.fetchLastTimeEntryWorkspaceInfo(
                userWorkspaceInfo.activeWorkspaceId!, userWorkspaceInfo.userId!);

        final timeEntryList = (timeEntriesResponse.body as List);

        if (timeEntriesResponse.body != null && timeEntryList.isNotEmpty) {
          var timeEntryModel = TimeEntryModel.fromJson(timeEntryList.first);
          userWorkspaceInfo.activeProjectId = timeEntryModel.projectId;
          userWorkspaceInfo.activeTaskId = timeEntryModel.taskId;
        }
        newUserWorkspaceInfo = userWorkspaceInfo;

        _objectBoxHelper.putUserWorkspaceInfo(newUserWorkspaceInfo);
      } on NoInternetException catch (e) {
        throw Failure()..type = FailureType.noInternet;
      } catch (e) {
        throw Failure()..type = FailureType.error;
      }
    } else {
      newUserWorkspaceInfo = _objectBoxHelper.fetchUserWorkspaceInfo();
    }

    return newUserWorkspaceInfo;
  }

  @override
  Future<UserWorkspaceInfoEntity> fetchUserInfo() async {
    late final userWorkspaceInfo;

    if (isUserWorkspaceInfoBoxEmpty()) {
      try {
        var response = await _remoteDataSource.fetchUserInfo();
        var userWorkspaceInfoModel = UserWorkspaceInfoModel.fromJson(response.body);
        userWorkspaceInfo = UserWorkspaceInfoEntity.fromModel(userWorkspaceInfoModel);
        _objectBoxHelper.putUserWorkspaceInfo(userWorkspaceInfo);
      } on NoInternetException catch (e) {
        throw Failure()..type = FailureType.noInternet;
      } catch (e) {
        throw Failure()..type = FailureType.error;
      }
    } else {
      userWorkspaceInfo = _objectBoxHelper.fetchUserWorkspaceInfo();
    }

    return userWorkspaceInfo;
  }

  @override
  Future<int> saveTimeEntry({required TimeEntryEntity timeEntry}) async {
    return await _objectBoxHelper.putTimeEntry(timeEntry);
  }

  @override
  bool deleteTimeEntry({required int timeEntryId}) {
      return _objectBoxHelper.deleteTimeEntry(timeEntryId);
  }

  @override
  Future<List<TimeEntryEntity>> postTimeEntries(
      {required String workspaceId, required List<TimeEntryEntity> timeEntryList}) async {
    try {
      for (var timeEntryEntity in timeEntryList) {
        var timeEntryModel = TimeEntryModel(
            workspaceId: timeEntryEntity.workspaceId,
            projectId: timeEntryEntity.projectId,
            taskId: timeEntryEntity.taskId,
            startDateTime: timeEntryEntity.startDateTimeMilli,
            endDateTime: timeEntryEntity.endDateTime,
            description: timeEntryEntity.description);

        await _remoteDataSource
            .postTimeEntries(workspaceId, timeEntryModel.toJson())
            .then((response) {
          if (response.statusCode == 201) {
            _objectBoxHelper.deleteTimeEntry(timeEntryEntity.entityId!);
          }
        });
      }
    } on NoInternetException catch (e) {
      throw Failure()..type = FailureType.noInternet;
    } catch (e) {
      throw Failure()..type = FailureType.error;
    }

    return _objectBoxHelper.fetchTimeEntries();
  }

  @override
  bool isTimeEntryBoxEmpty() {
    return _objectBoxHelper.isTimeEntryBoxEmpty();
  }

  @override
  bool isUserWorkspaceInfoBoxEmpty() {
    return _objectBoxHelper.isUserWorkspaceInfoBoxEmpty();
  }

  @override
  Future<int> updateUserInfo(UserWorkspaceInfoEntity userWorkspaceInfoEntity) async {
    return await _objectBoxHelper.putUserWorkspaceInfo(userWorkspaceInfoEntity);
  }

  closeStore() {
    _objectBoxHelper.closeStore();
  }

}

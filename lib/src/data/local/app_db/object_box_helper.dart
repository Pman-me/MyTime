import 'package:my_time/src/domain/entities/project_entity.dart';
import 'package:my_time/src/domain/entities/task_entity.dart';
import 'package:my_time/src/domain/entities/user_workspace_info_entity.dart';
import 'package:my_time/src/domain/entities/workspace_entity.dart';
import 'package:objectbox/objectbox.dart';

import '../../../domain/entities/time_entry_entity.dart';
import 'objectbox.g.dart';

class ObjectBoxHelper {
  Store? _store;
  Box<TimeEntryEntity>? _timeEntryBox;
  Box<WorkspaceEntity>? _workspaceBox;
  Box<ProjectEntity>? _projectBox;
  Box<TaskEntity>? _taskBox;
  Box<UserWorkspaceInfoEntity>? _userWorkspaceInfoBox;
  static ObjectBoxHelper? _instance;

  ObjectBoxHelper._();

  factory ObjectBoxHelper() {
    return _instance ??= ObjectBoxHelper._();
  }

  Future init() async {
    if (_store == null) {
      _store = await openStore();
      _timeEntryBox = Box<TimeEntryEntity>(_store!);
      _workspaceBox = Box<WorkspaceEntity>(_store!);
      _projectBox = Box<ProjectEntity>(_store!);
      _taskBox = Box<TaskEntity>(_store!);
      _userWorkspaceInfoBox = Box<UserWorkspaceInfoEntity>(_store!);
    }
  }

  //TimeEntry box operations
  List<TimeEntryEntity> fetchTimeEntries() => _timeEntryBox!.getAll();

  bool deleteTimeEntry(int entityId) => _timeEntryBox!.remove(entityId);

  Future<int> putTimeEntry(TimeEntryEntity timeEntry) async =>
      _timeEntryBox!.putAsync(timeEntry);

  bool isTimeEntryBoxEmpty() => _timeEntryBox!.isEmpty();

  // Future<int> updateWorkTime(WorkTimeEntity workTime) async =>
  //     _workTimeBox!.putAsync(workTime, mode: PutMode.update);

  //Workspace box operations
  List<WorkspaceEntity> fetchWorkspaces() => _workspaceBox!.getAll();

  Future<List<int>> putWorkspaces(List<WorkspaceEntity> workspaces) async =>
      _workspaceBox!.putMany(workspaces);

  bool isWorkspaceBoxEmpty() => _workspaceBox!.isEmpty();

  //Project box operations
  List<ProjectEntity> fetchProjects() => _projectBox!.getAll();

  Future<List<int>> putProjects(List<ProjectEntity> projects) async =>
      _projectBox!.putMany(projects);

  bool isProjectBoxEmpty() => _projectBox!.isEmpty();

  //Task box operations
  List<TaskEntity> fetchTasks() => _taskBox!.getAll();

  Future<List<int>> putTasks(List<TaskEntity> tasks) async => _taskBox!.putMany(tasks);

  bool isTaskBoxEmpty() => _taskBox!.isEmpty();

  //UserWorkspaceInfo box operations
  bool isUserWorkspaceInfoBoxEmpty() => _userWorkspaceInfoBox!.isEmpty();

  UserWorkspaceInfoEntity fetchUserWorkspaceInfo() =>
      _userWorkspaceInfoBox!.getAll().first;

  Future<int> putUserWorkspaceInfo(UserWorkspaceInfoEntity userWorkspaceInfo) =>
      _userWorkspaceInfoBox!.putAsync(userWorkspaceInfo);

  void closeStore() {
    if (_store != null && !_store!.isClosed()) {
      _store!.close();
      _store = null;
    }
  }
}

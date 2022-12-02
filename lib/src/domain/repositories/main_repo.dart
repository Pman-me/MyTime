import 'package:my_time/src/domain/entities/time_entry_entity.dart';
import 'package:my_time/src/domain/entities/workspace_entity.dart';

import '../entities/project_entity.dart';
import '../entities/task_entity.dart';
import '../entities/user_workspace_info_entity.dart';

abstract class IMainRepo {
  Future<List<WorkspaceEntity>> fetchWorkspaces();

  Future<List<ProjectEntity>> fetchProjects({required String workspaceId});

  Future<List<TaskEntity>> fetchTasks(
      {required String workspaceId, required String projectId});

  Future<UserWorkspaceInfoEntity> fetchLastTimeEntryWorkspaceInfo();

  List<TimeEntryEntity> fetchTimeEntries();

  Future<UserWorkspaceInfoEntity> fetchUserInfo();

  Future<int> updateUserInfo(UserWorkspaceInfoEntity userWorkspaceInfoEntity);

  Future<int> saveTimeEntry({required TimeEntryEntity timeEntry});

  bool deleteTimeEntry({required int timeEntryId});

  Future<List<TimeEntryEntity>> postTimeEntries(
      {required String workspaceId, required List<TimeEntryEntity> timeEntryList});

  bool isTimeEntryBoxEmpty();

  bool isUserWorkspaceInfoBoxEmpty();
}

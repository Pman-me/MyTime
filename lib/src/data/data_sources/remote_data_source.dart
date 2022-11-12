import 'package:chopper/chopper.dart';


abstract class IRemoteDataSource {
  Future<Response> fetchWorkspaces();

  Future<Response> fetchProjects(String workspaceId);

  Future<Response> fetchTasks(String workspaceId, String projectId);

  Future<Response> fetchLastTimeEntryWorkspaceInfo(String workspaceId, String userId);

  Future<Response> fetchUserInfo();

  Future<Response> postTimeEntries(
      String workspaceId, Map<String, dynamic> timeEntryJson);
}

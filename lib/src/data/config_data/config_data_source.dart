import 'package:chopper/chopper.dart';


abstract class IConfigDataSource{
  Future<Response> getWorkspaces();
  Future<Response> getProjects(String workspaceId);
  Future<Response> getTasks(String workspaceId,String projectId);
}
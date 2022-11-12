// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_source_impl.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$RemoteDataSourceImpl extends RemoteDataSourceImpl {
  _$RemoteDataSourceImpl([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RemoteDataSourceImpl;

  @override
  Future<Response<dynamic>> fetchWorkspaces() {
    final $url = '/workspaces';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> fetchProjects(String workspaceId) {
    final $url = '/workspaces/${workspaceId}/projects';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> fetchTasks(String workspaceId, String projectId) {
    final $url = '/workspaces/${workspaceId}/projects/${projectId}/tasks';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> fetchLastTimeEntryWorkspaceInfo(
      String workspaceId, String userId) {
    final $url = '/workspaces/${workspaceId}/user/${userId}/time-entries';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> fetchUserInfo() {
    final $url = '/user';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postTimeEntries(
      String workspaceId, Map<String, dynamic> timeEntryJson) {
    final $url = '/workspaces/${workspaceId}/time-entries';
    final $body = timeEntryJson;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}

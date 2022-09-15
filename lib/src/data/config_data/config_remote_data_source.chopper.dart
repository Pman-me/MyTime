// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_remote_data_source.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ConfigRemoteDataSource extends ConfigRemoteDataSource {
  _$ConfigRemoteDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ConfigRemoteDataSource;

  @override
  Future<Response<dynamic>> getWorkspaces() {
    final $url = '/workspaces';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProjects(String workspaceId) {
    final $url = '/workspaces/${workspaceId}/projects';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getTasks(String workspaceId, String projectId) {
    final $url = '/workspaces/${workspaceId}/projects/${projectId}/tasks';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}

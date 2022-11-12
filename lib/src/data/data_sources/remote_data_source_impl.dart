import 'package:chopper/chopper.dart';

import '../../constants/api_constant.dart';
import '../../util/interceptor.dart';
import '../data_sources/remote_data_source.dart';

part 'remote_data_source_impl.chopper.dart';

@ChopperApi()
abstract class RemoteDataSourceImpl extends ChopperService implements IRemoteDataSource {
  @FactoryConverter()
  @Get(path: '/workspaces')
  @override
  Future<Response> fetchWorkspaces();

  @Get(path: '/workspaces/{workspaceId}/projects')
  @override
  Future<Response> fetchProjects(@Path('workspaceId') String workspaceId);

  @Get(path: '/workspaces/{workspaceId}/projects/{projectId}/tasks')
  @override
  Future<Response> fetchTasks(
      @Path('workspaceId') String workspaceId, @Path('projectId') String projectId);

  @Get(path: '/workspaces/{workspaceId}/user/{userId}/time-entries')
  @override
  Future<Response> fetchLastTimeEntryWorkspaceInfo(
      @Path('workspaceId') String workspaceId, @Path('userId') String userId);

  @Get(path: '/user')
  @override
  Future<Response> fetchUserInfo();

  @Post(path: '/workspaces/{workspaceId}/time-entries')
  @override
  Future<Response> postTimeEntries(@Path('workspaceId') String workspaceId,
      @Body() Map<String, dynamic> timeEntryJson);

  static RemoteDataSourceImpl create(AppRequestInterceptor appRequestInterceptor) {
    final client = ChopperClient(
      baseUrl: kBaseUrl,
      services: [
        _$RemoteDataSourceImpl(),
      ],
      converter: const JsonConverter(),
      interceptors: [appRequestInterceptor],
    );

    return _$RemoteDataSourceImpl(client);
  }
}

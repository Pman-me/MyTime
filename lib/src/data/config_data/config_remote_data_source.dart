import 'package:chopper/chopper.dart';

import '../../constants/api_constant.dart';
import '../../util/interceptor.dart';
import 'config_data_source.dart';

part 'config_remote_data_source.chopper.dart';

@ChopperApi(baseUrl: '/workspaces')
abstract class ConfigRemoteDataSource extends ChopperService
    implements IConfigDataSource {

  @FactoryConverter()
  @Get()
  @override
  Future<Response> getWorkspaces();

  @Get(path: '/{workspaceId}/projects')
  @override
  Future<Response> getProjects(
      @Path('workspaceId') String workspaceId);

  @Get(path: '/{workspaceId}/projects/{projectId}/tasks')
  @override
  Future<Response> getTasks(
      @Path('workspaceId') String workspaceId,
      @Path('projectId') String projectId);

  static ConfigRemoteDataSource create() {
    final client = ChopperClient(
      baseUrl: kBaseUrl,
      services: [
        _$ConfigRemoteDataSource(),
      ],
      converter: const JsonConverter(),
      interceptors: [AppRequestInterceptor()],
    );

    return _$ConfigRemoteDataSource(client);
  }
}

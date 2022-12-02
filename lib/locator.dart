import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:my_time/src/data/local/app_db/object_box_helper.dart';
import 'package:my_time/src/data/repositories/api_key_repo.dart';
import 'package:my_time/src/data/repositories/main_repo.dart';
import 'package:my_time/src/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:my_time/src/util/api_key_container.dart';
import 'package:my_time/src/presentation/bloc/add_delete_time_entry_bloc/add_detail_time_entry_bloc.dart';

import 'src/constants/general_constant.dart';
import 'src/data/data_sources/remote_data_source_impl.dart';
import 'src/presentation/bloc/api_key_bloc/api_key_bloc.dart';
import 'src/presentation/bloc/main_bloc/main_bloc.dart';
import 'src/util/interceptor.dart';

GetIt locator = GetIt.instance;

setupLocators() async {
  locator.registerSingleton<MethodChannel>(const MethodChannel(kTimerMethodChannel));

  locator.registerSingleton<ApiKeyContainer>(ApiKeyContainer());

  locator.registerSingleton<AppRequestInterceptor>(
      AppRequestInterceptor(apiKeyContainer: locator()));

  //storage
  locator.registerSingleton<ObjectBoxHelper>(ObjectBoxHelper());
  locator.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  //interceptor
  locator.registerSingleton<RemoteDataSourceImpl>(
      RemoteDataSourceImpl.create(AppRequestInterceptor(apiKeyContainer: locator())));

  //repo
  locator.registerSingleton<ApiKeyRepo>(ApiKeyRepo(
      secureStorage: locator(), apiKeyContainer: locator(), objectBoxHelper: locator()));
  locator.registerSingleton<MainRepo>(
      MainRepo(remoteDataSource: locator(), objectBoxHelper: locator()));

  //bloc
  locator.registerSingleton<SplashBloc>(
      SplashBloc(apiKeyRepo: locator(), apiKeyContainer: locator(), mainRepo: locator()));
  locator.registerSingleton<ApiKeyBloc>(
      ApiKeyBloc(apiKeyRepo: locator(), apiKeyContainer: locator()));
  locator.registerSingleton<MainBloc>(
      MainBloc(mainRepo: locator(), timerMethodChannel: locator()));
  locator.registerSingleton<AddDetailTimeEntryBloc>(
      AddDetailTimeEntryBloc(mainRepo: locator()));
}

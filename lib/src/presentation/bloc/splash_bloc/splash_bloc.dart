import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/application/connectivity_service.dart';
import 'package:my_time/src/constants/route_constant.dart';
import 'package:my_time/src/data/repositories/main_repo.dart';
import 'package:my_time/src/util/api_key_container.dart';

import '../../../data/repositories/api_key_repo.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  ApiKeyRepo _apiKeyRepo;
  MainRepo _mainRepo;
  ApiKeyContainer _apiKeyContainer;

  SplashBloc(
      {required ApiKeyRepo apiKeyRepo,
      required MainRepo mainRepo,
      required ApiKeyContainer apiKeyContainer})
      : _apiKeyRepo = apiKeyRepo,
        _mainRepo = mainRepo,
        _apiKeyContainer = apiKeyContainer,
        super(SplashState()) {
    on<SplashStartedEvent>(_onStarted);
    on<SplashRetryEvent>(_onRetry);
  }

  _onStarted(SplashStartedEvent event, Emitter<SplashState> emit) async {
    await _apiKeyRepo.initObjectBox();

    if (await checkConnectivity() || !_mainRepo.isUserWorkspaceInfoBoxEmpty()) {
      await Future.delayed(const Duration(milliseconds: 500)).then((value) async {
        if (await _apiKeyRepo.checkApiKeyExists()) {
          _apiKeyContainer.setApiKey = await _apiKeyRepo.fetchApiKey();
          emit(SplashNavigatedTo(route: kMainScreenRoute));
        } else {
          emit(SplashNavigatedTo(route: kApiKeyScreenRoute));
        }
      });
    } else {
      emit(SplashState(networkConnectivity: false));
    }
  }

  Future<FutureOr<void>> _onRetry(
      SplashRetryEvent event, Emitter<SplashState> emit) async {
    emit(SplashState());
    add(SplashStartedEvent());
  }
}

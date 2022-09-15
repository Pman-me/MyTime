import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/constants/general_constant.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final double hourInMinute = 60;
  double _elapseInMinute = 0;
  final MethodChannel timerMethodChannel;

  MainBloc({required this.timerMethodChannel})
      : super(MainInitialState(elapseInSeconds: 0, sleekCircularSliderElapseValue: 0)) {
    on<MainStartedEvent>(_onStarted);
    on<MainTimerTickedEvent>(_onTimerTicked);
    on<MainTimerStartedEvent>(_onTimerStarted);
    on<MainTimerPausedEvent>(_onTimerPaused);
    on<MainTimerResumedEvent>(_onTimerResumed);
    on<MainTimerResetEvent>(_onTimerReset);
  }

  FutureOr<void> _onStarted(MainStartedEvent event, Emitter<MainState> emit) async {
    //TODO if stopped recently, show previous elapsed
    onStreamElapsedTime();
  }

  void onStreamElapsedTime() {
    timerMethodChannel.setMethodCallHandler((call) async {
      if (call.method == kTick) {
        _tick(call.arguments);
      }
    });
  }

  Future<void> _startTimer() async {
    await timerMethodChannel.invokeMethod(kMethodChannelActionPlay);
  }

  FutureOr<void> _onTimerStarted(
      MainTimerStartedEvent event, Emitter<MainState> emit) async {
    _startTimer();
    onStreamElapsedTime();
  }

  Future<FutureOr<void>> _onTimerTicked(
      MainTimerTickedEvent event, Emitter<MainState> emit) async {
    _elapseInMinute = event.sleekCircularSliderElapseValue ?? _elapseInMinute;
    emit(MainTimerRunInProgressState(
        elapseInSeconds: event.elapseInSeconds,
        sleekCircularSliderElapseValue: _elapseInMinute));
  }

  FutureOr<void> _onTimerPaused(MainTimerPausedEvent event, Emitter<MainState> emit) {
    if (state is MainTimerRunInProgressState) {
      timerMethodChannel.invokeMethod(kMethodChannelActionPause);
      emit(MainTimerRunPauseState(
          elapseInSeconds: (state as MainTimerRunInProgressState).elapseInSeconds,
          sleekCircularSliderElapseValue:
              (state as MainTimerRunInProgressState).sleekCircularSliderElapseValue));
    }
  }

  FutureOr<void> _onTimerResumed(MainTimerResumedEvent event, Emitter<MainState> emit) {
    if (state is MainTimerRunPauseState) {
      timerMethodChannel.invokeMethod(kMethodChannelActionPlay);
      emit(MainTimerRunInProgressState(
          elapseInSeconds: (state as MainTimerRunPauseState).elapseInSeconds,
          sleekCircularSliderElapseValue:
              (state as MainTimerRunPauseState).sleekCircularSliderElapseValue));
    }
  }

  FutureOr<void> _onTimerReset(MainTimerResetEvent event, Emitter<MainState> emit) {
    timerMethodChannel.invokeMethod(kMethodChannelActionReset);
    emit(MainInitialState(elapseInSeconds: 0, sleekCircularSliderElapseValue: 0));
  }

  void _tick(int elapsed) {
    if (elapsed > 0 && elapsed % 60 == 0) {
      add(MainTimerTickedEvent(
          elapseInSeconds: elapsed,
          sleekCircularSliderElapseValue: ((elapsed / 60) % 60).floor().toDouble()));
    } else {
      add(MainTimerTickedEvent(elapseInSeconds: elapsed));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

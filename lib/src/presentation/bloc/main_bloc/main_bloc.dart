import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:my_time/src/constants/general_constant.dart';
import 'package:my_time/src/domain/entities/time_entry_entity.dart';
import 'package:my_time/src/domain/entities/user_workspace_info_entity.dart';
import 'package:my_time/src/domain/entities/workspace_entity.dart';

import '../../../data/repositories/main_repo.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final double hourInMinute = 60;
  double _elapsedInMinute = 0;
  final MethodChannel _timerMethodChannel;
  final MainRepo _mainRepo;

  late final UserWorkspaceInfoEntity userWorkspaceInfo;

  MainBloc({required MainRepo mainRepo, required MethodChannel timerMethodChannel})
      : _mainRepo = mainRepo,
        _timerMethodChannel = timerMethodChannel,
        super(MainState(
            elapsedInSeconds: 0,
            sleekCircularSliderElapsedValue: 0,
            timeEntryList: List.from(<TimeEntryEntity>[], growable: true),
            isTimerRunInProgress: false,
            canBeSaved: false)) {
    on<MainStartedEvent>(_onStarted);
    on<MainTimerTickedEvent>(_onTimerTicked);
    on<MainTimerStartedEvent>(_onTimerStarted);
    on<MainTimerPausedEvent>(_onTimerPaused);
    on<MainTimerResumedEvent>(_onTimerResumed);
    on<MainTimerResetEvent>(_onTimerReset);
    on<MainWorkspaceHasChangedEvent>(_onWorkspaceChanged);
    on<MainCanBeSavedTimeEntryEvent>(_onCanBeSavedTimeEntry);
    on<MainSaveTimeEntryEvent>(_onSaveTimeEntry);
    on<MainAddTimeEntryEvent>(_onAddTimeEntry);
    on<MainOpenBottomSheetEvent>(_onOpenBottomSheet);
    on<MainCloseBottomSheetEvent>(_closeBottomSheet);
    on<MainPostTimeEntryList>(_onPostTimeEntryList);
  }

  FutureOr<void> _onStarted(MainStartedEvent event, Emitter<MainState> emit) async {
    await _wasTimerRunInProgress();
    onElapsedTimeStream();
    userWorkspaceInfo = await _mainRepo.fetchLastTimeEntryWorkspaceInfo();
    await _fetchWorkspaces(emit, userWorkspaceInfo);
    _fetchTimeEntries(emit);
  }

  Future<void> _wasTimerRunInProgress() async {
    await _timerMethodChannel.invokeMethod(kMethodChannelWasTimerRunning).then((value) {
      if (value is int) {
        _tick(value);
        add(MainTimerPausedEvent());
        add(MainCanBeSavedTimeEntryEvent(canBeSaved: true));
      }
    });
  }

  Future<void> _fetchWorkspaces(
      Emitter<MainState> emit, UserWorkspaceInfoEntity userWorkspaceInfo) async {
    var activeWorkspace;
    var workspaces;
    await _mainRepo.fetchWorkspaces().then((result) {
      for (var workspace in result) {
        if (workspace.id == userWorkspaceInfo.activeWorkspaceId) {
          activeWorkspace = workspace;
        }
      }
      workspaces = result;
    });
    emit(state.copyWith(workspaces: workspaces, activeWorkspace: activeWorkspace));
  }

  _fetchTimeEntries(Emitter<MainState> emit) {
    final timeEntryList = _mainRepo.fetchTimeEntries();
    final reversedTimeEntryList = timeEntryList.reversed;
    if (reversedTimeEntryList.isNotEmpty) {
      emit(state.copyWith(timeEntryList: reversedTimeEntryList.toList()));
    }
  }

  FutureOr<void> _onTimerStarted(
      MainTimerStartedEvent event, Emitter<MainState> emit) async {
    _startTimer();
  }

  FutureOr<void> _onTimerTicked(
      MainTimerTickedEvent event, Emitter<MainState> emit) async {
    _elapsedInMinute = event.sleekCircularSliderElapseValue ?? _elapsedInMinute;
    emit(state.copyWith(
        elapsedInSeconds: event.elapsedInSeconds,
        sleekCircularSliderElapsedValue: _elapsedInMinute,
        isTimerRunInProgress: true,
        canBeSaved: true));
  }

  FutureOr<void> _onTimerPaused(MainTimerPausedEvent event, Emitter<MainState> emit) {
    if (state.isTimerRunInProgress) {
      _timerMethodChannel.invokeMethod(kMethodChannelActionPause);
      emit(state.copyWith(isTimerRunInProgress: false));
    }
  }

  FutureOr<void> _onTimerResumed(MainTimerResumedEvent event, Emitter<MainState> emit) {
    if (!state.isTimerRunInProgress) {
      _timerMethodChannel.invokeMethod(kMethodChannelActionPlay);
      emit(state.copyWith(isTimerRunInProgress: true));
    }
  }

  FutureOr<void> _onTimerReset(MainTimerResetEvent event, Emitter<MainState> emit) {
    _timerMethodChannel.invokeMethod(kMethodChannelActionReset);
    emit(state.copyWith(
        elapsedInSeconds: 0,
        sleekCircularSliderElapsedValue: 0,
        isTimerRunInProgress: false));
    add(MainCanBeSavedTimeEntryEvent(canBeSaved: false));
  }

  FutureOr<void> _onWorkspaceChanged(
      MainWorkspaceHasChangedEvent event, Emitter<MainState> emit) {
    late WorkspaceEntity selectedWorkspace;

    for (var workspace in state.workspaces!) {
      if (workspace.name == event.selectedWorkspace) {
        selectedWorkspace = workspace;
        userWorkspaceInfo.activeWorkspaceId = workspace.id;
        userWorkspaceInfo.activeProjectId = null;
        userWorkspaceInfo.activeTaskId = null;
        _mainRepo.updateUserInfo(userWorkspaceInfo);
        break;
      }
    }

    emit(state.copyWith(activeWorkspace: selectedWorkspace));
  }

  FutureOr<void> _onCanBeSavedTimeEntry(
      MainCanBeSavedTimeEntryEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(canBeSaved: event.canBeSaved));
  }

  FutureOr<void> _onSaveTimeEntry(MainSaveTimeEntryEvent event, Emitter<MainState> emit) {
    DateFormat dateFormatter = DateFormat(kTimeEntryDateFormat);
    DateTime endDateTime = DateTime.now();
    DateTime startDateTime = DateTime.fromMillisecondsSinceEpoch(
        endDateTime.millisecondsSinceEpoch - (event.elapsedInSeconds * 1000));

    TimeEntryEntity timeEntry = TimeEntryEntity(
      workspaceId: userWorkspaceInfo.activeWorkspaceId,
      projectId: userWorkspaceInfo.activeProjectId,
      taskId: userWorkspaceInfo.activeTaskId,
      elapsedInSeconds: event.elapsedInSeconds,
      description: kTimeEntryDefaultDescription,
      startDateTimeMilli: '${dateFormatter.format(startDateTime)}Z',
      endDateTime: '${dateFormatter.format(endDateTime)}Z',
    );

    _mainRepo.saveTimeEntry(timeEntry: timeEntry);

    final timeEntryList = state.timeEntryList!.reversed.toList();
    timeEntryList.add(timeEntry);
    final newTimeEntryList = List.of(timeEntryList.reversed);

    emit(state.copyWith(timeEntryList: newTimeEntryList));

    add(MainTimerResetEvent());
  }

  FutureOr<void> _onAddTimeEntry(MainAddTimeEntryEvent event, Emitter<MainState> emit) {}

  FutureOr<void> _onOpenBottomSheet(
      MainOpenBottomSheetEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(openBottomSheet: true));
  }

  FutureOr<void> _closeBottomSheet(
      MainCloseBottomSheetEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(openBottomSheet: false));
  }

  FutureOr<void> _onPostTimeEntryList(
      MainPostTimeEntryList event, Emitter<MainState> emit) async {
    if (!_mainRepo.isTimeEntryBoxEmpty()) {
      emit(state.copyWith(isTimeEntryListSending: true));
      final timeEntryList = _mainRepo.fetchTimeEntries();

      final postTimeEntryListResponse = await _mainRepo.postTimeEntries(
          workspaceId: userWorkspaceInfo.activeWorkspaceId!,
          timeEntryList: timeEntryList);

      emit(state.copyWith(isTimeEntryListSending: false));

      if (postTimeEntryListResponse.isEmpty) {
        final newTimeEntryList = <TimeEntryEntity>[];
        emit(state.copyWith(timeEntryList: newTimeEntryList));
      }
    }
  }

  void _tick(int elapsed) {
    add(MainTimerTickedEvent(
        elapsedInSeconds: elapsed,
        sleekCircularSliderElapseValue: ((elapsed / 60) % 60).floor().toDouble()));
  }

  Future<void> _startTimer() async {
    await _timerMethodChannel.invokeMethod(kMethodChannelActionPlay);
  }

  void onElapsedTimeStream() {
    _timerMethodChannel.setMethodCallHandler((call) async {
      if (call.method == kTick) {
        _tick(call.arguments);
      }
    });
  }

  @override
  Future<void> close() {
    _mainRepo.closeStore();
    return super.close();
  }
}

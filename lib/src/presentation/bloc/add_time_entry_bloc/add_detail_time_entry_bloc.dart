import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/data/repositories/main_repo.dart';

import '../../../domain/entities/project_entity.dart';
import '../../../domain/entities/task_entity.dart';

part 'add_detail_time_entry_event.dart';

part 'add_detail_time_entry_state.dart';

class AddDetailTimeEntryBloc extends Bloc<AddTimeEntryEvent, AddDetailTimeEntryState> {
  MainRepo mainRepo;
  late String _workspaceId;

  set workspaceId(String value) {
    _workspaceId = value;
  }

  AddDetailTimeEntryBloc({required this.mainRepo})
      : super(AddDetailTimeEntryState(
            isProjectsPanelExpanded: false,
            isTasksPanelExpanded: false,
            networkConnectivity: true)) {
    on<AddDetailTimeEntryStartedEvent>(_onStarted);
    on<CollapseOrExpandProjectsPanelEvent>(_onProjectsCollapseOrExpand);
    on<CollapseOrExpandTasksPanelEvent>(_onTasksCollapseOrExpand);
    on<AddedDetailTimeEntryEvent>(_onAdded);
    on<CloseBottomSheetEvent>(_onCloseBottomSheet);
  }

  FutureOr<void> _onStarted(
      AddDetailTimeEntryStartedEvent event, Emitter<AddDetailTimeEntryState> emit) {
    // mainRepo.fetchProjects(workspaceId: _workspaceId).then((response) {
    //   emit(state.copyWith(projects: response));
    // });
    emit(state.copyWith(networkConnectivity: false));
  }

  FutureOr<void> _onProjectsCollapseOrExpand(
      CollapseOrExpandProjectsPanelEvent event, Emitter<AddDetailTimeEntryState> emit) {
    emit(state.copyWith(isProjectsPanelExpanded: true));
  }

  FutureOr<void> _onTasksCollapseOrExpand(
      CollapseOrExpandTasksPanelEvent event, Emitter<AddDetailTimeEntryState> emit) {
    emit(state.copyWith(isTasksPanelExpanded: true));
  }

  FutureOr<void> _onAdded(
      AddedDetailTimeEntryEvent event, Emitter<AddDetailTimeEntryState> emit) {}

  FutureOr<void> _onCloseBottomSheet(
      CloseBottomSheetEvent event, Emitter<AddDetailTimeEntryState> emit) {}
}

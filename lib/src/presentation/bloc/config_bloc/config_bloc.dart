import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/domain/entities/workspace_entity.dart';
import 'package:my_time/src/util/api_key_container.dart';

import '../../../data/config_data/config_data_repository_impl.dart';
import '../../../domain/entities/project_enity.dart';
import '../../../domain/entities/task_entity.dart';

part 'config_event.dart';

part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigDataRepositoryImpl configDataRepositoryImpl;

  ConfigBloc({required this.configDataRepositoryImpl}) : super(ConfigState()) {
    on<ConfigGetClockifyInfoRequestWithNewApiKey>(_onGetConfig);
    on<ConfigExpandWorkspaceEvent>(_onWorkspaceExpanded);
    on<ConfigExpandProjectEvent>(_onProjectExpanded);
    on<ConfigExpandTaskEvent>(_onTaskExpanded);
    on<ConfigSelectWorkspaceEvent>(_onWorkspaceSelected);
    on<ConfigSelectProjectEvent>(_onProjectSelected);
    on<ConfigSelectTaskEvent>(_onTaskSelected);
  }

  Future<FutureOr<void>> _onGetConfig(
      ConfigGetClockifyInfoRequestWithNewApiKey event, Emitter<ConfigState> emit) async {
    ApiKeyContainer.setApiKey = event.apiKeyController.text.trim();

    final workspaces = await configDataRepositoryImpl.getWorkspaces();

    event.apiKeyController.clear();
    emit(state.copyWith(workspaces: workspaces));
  }

  FutureOr<void> _onWorkspaceExpanded(
      ConfigExpandWorkspaceEvent event, Emitter<ConfigState> emit) {
    emit(state.copyWith(isWorkspacesExpanded: !state.isWorkspacesExpanded));
  }

  Future<FutureOr<void>> _onWorkspaceSelected(
      ConfigSelectWorkspaceEvent event, Emitter<ConfigState> emit) async {
    emit(state.copyWith(isProjectsLoading: true));

    final projects = await configDataRepositoryImpl.getProjects(event.workspaceId);

    emit(state.copyWith(
        projects: projects,
        isProjectsLoading: false,
        selectedWorkspaceId: event.workspaceId));
  }

  FutureOr<void> _onProjectExpanded(
      ConfigExpandProjectEvent event, Emitter<ConfigState> emit) {
    emit(state.copyWith(isProjectsExpanded: !state.isProjectsExpanded));
  }

  Future<FutureOr<void>> _onProjectSelected(
      ConfigSelectProjectEvent event, Emitter<ConfigState> emit) async {
    emit(state.copyWith(isTasksLoading: true));

    final tasks = await configDataRepositoryImpl.getTasks(
        state.selectedWorkspaceId!, event.projectId);

    emit(state.copyWith(tasks: tasks, isTasksLoading: false));
  }

  FutureOr<void> _onTaskSelected(ConfigSelectTaskEvent event, Emitter<ConfigState> emit) {
    emit(state.copyWith(isTasksExpanded: !state.isTasksExpanded));
  }

  FutureOr<void> _onTaskExpanded(ConfigExpandTaskEvent event, Emitter<ConfigState> emit) {
    emit(state.copyWith(isTasksExpanded: !state.isTasksExpanded));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/api_key_repo.dart';
import '../../../util/api_key_container.dart';

part 'api_key_event.dart';

part 'api_key_state.dart';

class ApiKeyBloc extends Bloc<ApiKeyEvent, ApiKeyState> {
  ApiKeyRepo apiKeyRepo;
  ApiKeyContainer apiKeyContainer;

  ApiKeyBloc({required this.apiKeyRepo,required this.apiKeyContainer}) : super(ApiKeyInitialState()) {
    on<ApiKeyEntered>(_onApiKeyEntered);
    // on<ConfigExpandWorkspaceEvent>(_onWorkspaceExpanded);
    // on<ConfigExpandProjectEvent>(_onProjectExpanded);
    // on<ConfigExpandTaskEvent>(_onTaskExpanded);
    // on<ConfigSelectWorkspaceEvent>(_onWorkspaceSelected);
    // on<ConfigSelectProjectEvent>(_onProjectSelected);
    // on<ConfigSelectTaskEvent>(_onTaskSelected);
  }

  FutureOr<void> _onApiKeyEntered(ApiKeyEntered event, Emitter<ApiKeyState> emit) async {
    var apiKey = event.apiKeyController.text.trim();
    if (apiKey.isNotEmpty) {
      emit(ApiKeySavingState(true));
      await apiKeyRepo.saveApiKey(apiKey);
      apiKeyContainer.setApiKey = apiKey;
      event.apiKeyController.clear();
      emit(ApiKeySavingState(false));
      emit(NavigatedToMainScreenState());
    }
  }

// Future<FutureOr<void>> _onGetConfig(
//     ConfigGetClockifyInfoRequestWithNewApiKey event, Emitter<ApiKeyState> emit) async {
//
//   final workspaces = await configDataRepositoryImpl.getWorkspaces();
//
//   event.apiKeyController.clear();
//   emit(state.copyWith(workspaces: workspaces));
// }
//
// FutureOr<void> _onWorkspaceExpanded(
//     ConfigExpandWorkspaceEvent event, Emitter<ApiKeyState> emit) {
//   emit(state.copyWith(isWorkspacesExpanded: !state.isWorkspacesExpanded));
// }
//
// Future<FutureOr<void>> _onWorkspaceSelected(
//     ConfigSelectWorkspaceEvent event, Emitter<ApiKeyState> emit) async {
//   emit(state.copyWith(isProjectsLoading: true));
//
//   final projects = await configDataRepositoryImpl.getProjects(event.workspaceId);
//
//   emit(state.copyWith(
//       projects: projects,
//       isProjectsLoading: false,
//       selectedWorkspaceId: event.workspaceId));
// }
//
// FutureOr<void> _onProjectExpanded(
//     ConfigExpandProjectEvent event, Emitter<ApiKeyState> emit) {
//   emit(state.copyWith(isProjectsExpanded: !state.isProjectsExpanded));
// }
//
// Future<FutureOr<void>> _onProjectSelected(
//     ConfigSelectProjectEvent event, Emitter<ApiKeyState> emit) async {
//   emit(state.copyWith(isTasksLoading: true));
//
//   final tasks = await configDataRepositoryImpl.getTasks(
//       state.selectedWorkspaceId!, event.projectId);
//
//   emit(state.copyWith(tasks: tasks, isTasksLoading: false));
// }
//
// FutureOr<void> _onTaskSelected(ConfigSelectTaskEvent event, Emitter<ApiKeyState> emit) {
//   emit(state.copyWith(isTasksExpanded: !state.isTasksExpanded));
// }
//
// FutureOr<void> _onTaskExpanded(ConfigExpandTaskEvent event, Emitter<ApiKeyState> emit) {
//   emit(state.copyWith(isTasksExpanded: !state.isTasksExpanded));
// }
}

part of 'api_key_bloc.dart';

@immutable
abstract class ApiKeyState {
  // List<WorkspaceEntity>? workspaces;
  // List<ProjectEntity>? projects;
  // List<TaskEntity>? tasks;
  // bool isWorkspacesExpanded;
  //
  // bool isProjectsExpanded;
  // bool isProjectsLoading;
  // bool isTasksExpanded;
  // bool isTasksLoading;
  // String? selectedWorkspaceId;
  //
  // ApiKeyState(
  //     {List<WorkspaceEntity>? workspaces,
  //     List<ProjectEntity>? projects,
  //     List<TaskEntity>? tasks,
  //     bool? isWorkspacesExpanded,
  //     bool? isProjectsExpanded,
  //     bool? isProjectsLoading,
  //     bool? isTasksExpanded,
  //     bool? isTasksLoading,
  //     String? selectedWorkspaceId})
  //     : workspaces = workspaces,
  //       projects = projects,
  //       tasks = tasks,
  //       isWorkspacesExpanded = isWorkspacesExpanded ?? false,
  //       isProjectsExpanded = isProjectsExpanded ?? false,
  //       isProjectsLoading = isProjectsLoading ?? false,
  //       isTasksExpanded = isTasksExpanded ?? false,
  //       isTasksLoading = isTasksLoading ?? false,
  //       selectedWorkspaceId = selectedWorkspaceId ?? '';
  //
  // ApiKeyState copyWith({
  //   List<WorkspaceEntity>? workspaces,
  //   List<ProjectEntity>? projects,
  //   List<TaskEntity>? tasks,
  //   bool? isWorkspacesExpanded,
  //   bool? isProjectsExpanded,
  //   bool? isProjectsLoading,
  //   bool? isTasksExpanded,
  //   bool? isTasksLoading,
  //   String? selectedWorkspaceId,
  // }) {
  //   return ApiKeyState(
  //     workspaces: workspaces ?? this.workspaces,
  //     projects: projects ?? this.projects,
  //     tasks: tasks ?? this.tasks,
  //     isWorkspacesExpanded: isWorkspacesExpanded ?? this.isWorkspacesExpanded,
  //     isProjectsExpanded: isProjectsExpanded ?? this.isProjectsExpanded,
  //     isProjectsLoading: isProjectsLoading ?? this.isProjectsLoading,
  //     isTasksExpanded: isTasksExpanded ?? this.isTasksExpanded,
  //     isTasksLoading: isTasksLoading ?? this.isTasksLoading,
  //     selectedWorkspaceId: selectedWorkspaceId ?? this.selectedWorkspaceId,
  //   );
  // }
  //
  // @override
  // List<Object> get props => [
  //       workspaces ?? [],
  //       projects ?? [],
  //       tasks ?? [],
  //       selectedWorkspaceId ?? '',
  //       isWorkspacesExpanded,
  //       isProjectsExpanded,
  //       isTasksExpanded,
  //       isProjectsLoading,
  //       isTasksLoading
  //     ];
}

class ApiKeyInitialState extends ApiKeyState {}

class ApiKeySavingState extends ApiKeyState{
  bool isApiKeySaving;

  ApiKeySavingState([this.isApiKeySaving = false]);
}

class NavigatedToMainScreenState extends ApiKeyState {}

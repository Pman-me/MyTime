part of 'config_bloc.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ConfigGetClockifyInfoRequestWithNewApiKey extends ConfigEvent {
  final apiKeyController;

  ConfigGetClockifyInfoRequestWithNewApiKey({required this.apiKeyController});
}

class ConfigExpandWorkspaceEvent extends ConfigEvent {
  final bool isWorkspacesExpanded;

  ConfigExpandWorkspaceEvent({required this.isWorkspacesExpanded});
}

class ConfigSelectWorkspaceEvent extends ConfigEvent {
  final String workspaceId;

  ConfigSelectWorkspaceEvent({required this.workspaceId});
}

class ConfigExpandProjectEvent extends ConfigEvent {
  final bool isProjectsExpanded;

  ConfigExpandProjectEvent({required this.isProjectsExpanded});
}

class ConfigSelectProjectEvent extends ConfigEvent {
  final String projectId;

  ConfigSelectProjectEvent({required this.projectId});
}

class ConfigExpandTaskEvent extends ConfigEvent {
  final bool isTasksExpanded;

  ConfigExpandTaskEvent({required this.isTasksExpanded});
}

class ConfigSelectTaskEvent extends ConfigEvent {
  final String? taskId;

  ConfigSelectTaskEvent({required this.taskId});
}

part of 'api_key_bloc.dart';

@immutable
abstract class ApiKeyEvent {}

class ApiKeyEntered extends ApiKeyEvent {
  TextEditingController apiKeyController;

  ApiKeyEntered({required this.apiKeyController});
}

class ConfigGetClockifyInfoRequestWithNewApiKey extends ApiKeyEvent {
  final apiKeyController;

  ConfigGetClockifyInfoRequestWithNewApiKey({required this.apiKeyController});
}

class ConfigExpandWorkspaceEvent extends ApiKeyEvent {
  final bool isWorkspacesExpanded;

  ConfigExpandWorkspaceEvent({required this.isWorkspacesExpanded});
}

class ConfigSelectWorkspaceEvent extends ApiKeyEvent {
  final String workspaceId;

  ConfigSelectWorkspaceEvent({required this.workspaceId});
}

class ConfigExpandProjectEvent extends ApiKeyEvent {
  final bool isProjectsExpanded;

  ConfigExpandProjectEvent({required this.isProjectsExpanded});
}

class ConfigSelectProjectEvent extends ApiKeyEvent {
  final String projectId;

  ConfigSelectProjectEvent({required this.projectId});
}

class ConfigExpandTaskEvent extends ApiKeyEvent {
  final bool isTasksExpanded;

  ConfigExpandTaskEvent({required this.isTasksExpanded});
}

class ConfigSelectTaskEvent extends ApiKeyEvent {
  final String? taskId;

  ConfigSelectTaskEvent({required this.taskId});
}

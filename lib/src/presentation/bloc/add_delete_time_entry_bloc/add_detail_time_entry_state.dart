part of 'add_detail_time_entry_bloc.dart';

@immutable
class AddDetailTimeEntryState extends Equatable {
  bool isProjectsPanelExpanded;
  bool isTasksPanelExpanded;
  List<ProjectEntity>? projects;
  List<TaskEntity>? tasks;
  bool? closeBottomSheet;
  bool? networkConnectivity;

  AddDetailTimeEntryState(
      {required this.isProjectsPanelExpanded,
      required this.isTasksPanelExpanded,
      this.projects,
      this.tasks,
      this.closeBottomSheet,
      this.networkConnectivity});

  AddDetailTimeEntryState copyWith(
      {bool? isProjectsPanelExpanded,
      bool? isTasksPanelExpanded,
      List<ProjectEntity>? projects,
      List<TaskEntity>? tasks,
      bool? closeBottomSheet,
      bool? networkConnectivity}) {
    return AddDetailTimeEntryState(
        isProjectsPanelExpanded: isProjectsPanelExpanded ?? this.isProjectsPanelExpanded,
        isTasksPanelExpanded: isTasksPanelExpanded ?? this.isTasksPanelExpanded,
        projects: projects ?? this.projects,
        tasks: tasks ?? this.tasks,
        closeBottomSheet: closeBottomSheet ?? this.closeBottomSheet,
        networkConnectivity: networkConnectivity ?? this.networkConnectivity);
  }

  @override
  List<Object?> get props => [
        isProjectsPanelExpanded,
        isTasksPanelExpanded,
        projects ?? [],
        tasks ?? [],
        closeBottomSheet,
        networkConnectivity
      ];
}

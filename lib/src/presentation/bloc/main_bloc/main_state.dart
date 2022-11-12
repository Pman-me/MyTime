part of 'main_bloc.dart';

@immutable
class MainState extends Equatable {
  late int elapsedInSeconds;
  late double sleekCircularSliderElapsedValue;
  WorkspaceEntity? activeWorkspace;
  List<WorkspaceEntity>? workspaces;
  List<TimeEntryEntity>? timeEntryList;
  late bool isTimerRunInProgress;
  bool? canBeSaved;
  bool openBottomSheet;
  bool isTimeEntryListSending;

  MainState({
    required this.elapsedInSeconds,
    required this.sleekCircularSliderElapsedValue,
    required this.isTimerRunInProgress,
    this.workspaces,
    this.timeEntryList,
    this.activeWorkspace,
    this.canBeSaved,
    this.openBottomSheet = false,
    this.isTimeEntryListSending = false,
  });

  MainState copyWith({
    int? elapsedInSeconds,
    double? sleekCircularSliderElapsedValue,
    WorkspaceEntity? activeWorkspace,
    List<WorkspaceEntity>? workspaces,
    List<TimeEntryEntity>? timeEntryList,
    bool? isTimerRunInProgress,
    bool? canBeSaved,
    bool? openBottomSheet,
    bool? isTimeEntryListSending,
  }) {
    return MainState(
      elapsedInSeconds: elapsedInSeconds ?? this.elapsedInSeconds,
      sleekCircularSliderElapsedValue:
          sleekCircularSliderElapsedValue ?? this.sleekCircularSliderElapsedValue,
      workspaces: workspaces ?? this.workspaces,
      timeEntryList: timeEntryList ?? this.timeEntryList,
      activeWorkspace: activeWorkspace ?? this.activeWorkspace,
      isTimerRunInProgress: isTimerRunInProgress ?? this.isTimerRunInProgress,
      canBeSaved: canBeSaved ?? this.canBeSaved,
      openBottomSheet: openBottomSheet ?? this.openBottomSheet,
      isTimeEntryListSending: isTimeEntryListSending ?? this.isTimeEntryListSending,
    );
  }

  @override
  List<Object> get props => [
        elapsedInSeconds,
        sleekCircularSliderElapsedValue,
        isTimerRunInProgress,
        canBeSaved ?? false,
        openBottomSheet,
        isTimeEntryListSending,
        activeWorkspace ?? WorkspaceEntity(),
        workspaces ?? <WorkspaceEntity>[],
        timeEntryList ?? <TimeEntryEntity>[]
      ];
}

part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainStartedEvent extends MainEvent {}

@immutable
class MainTimerTickedEvent extends MainEvent {
  int elapsedInSeconds;
  double? sleekCircularSliderElapseValue;

  MainTimerTickedEvent(
      {required this.elapsedInSeconds, this.sleekCircularSliderElapseValue});
}

class MainTimerStartedEvent extends MainEvent {}

class MainTimerResumedEvent extends MainEvent {}

class MainTimerPausedEvent extends MainEvent {}

class MainTimerResetEvent extends MainEvent {}

class MainCanBeSavedTimeEntryEvent extends MainEvent {
  bool canBeSaved;

  MainCanBeSavedTimeEntryEvent({required this.canBeSaved});
}

class MainSaveTimeEntryEvent extends MainEvent {
  int elapsedInSeconds;

  MainSaveTimeEntryEvent({required this.elapsedInSeconds});
}

class MainDeleteTimeEntryEvent extends MainEvent {
  int timeEntryId;
  int timeEntryIndex;

  MainDeleteTimeEntryEvent({required this.timeEntryId, required this.timeEntryIndex});
}

class MainOpenBottomSheetEvent extends MainEvent {}

class MainCloseBottomSheetEvent extends MainEvent {}

class MainWorkspaceHasChangedEvent extends MainEvent {
  String selectedWorkspace;

  MainWorkspaceHasChangedEvent({required this.selectedWorkspace});
}

class MainPostTimeEntryList extends MainEvent {}

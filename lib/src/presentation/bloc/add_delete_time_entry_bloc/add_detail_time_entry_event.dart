part of 'add_detail_time_entry_bloc.dart';

@immutable
abstract class AddTimeEntryEvent {}

class AddDetailTimeEntryStartedEvent extends AddTimeEntryEvent{}

class AddedDetailTimeEntryEvent extends AddTimeEntryEvent{}

class CollapseOrExpandProjectsPanelEvent extends AddTimeEntryEvent {
  bool isExpanded;

  CollapseOrExpandProjectsPanelEvent({required this.isExpanded});
}

class CollapseOrExpandTasksPanelEvent extends AddTimeEntryEvent {
  bool isExpanded;

  CollapseOrExpandTasksPanelEvent({required this.isExpanded});
}

class CloseBottomSheetEvent extends AddTimeEntryEvent{}

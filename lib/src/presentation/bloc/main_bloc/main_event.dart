part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainStartedEvent extends MainEvent {}

@immutable
class MainTimerTickedEvent extends MainEvent {
  int elapseInSeconds;
  double? sleekCircularSliderElapseValue;

  MainTimerTickedEvent(
      {required this.elapseInSeconds, this.sleekCircularSliderElapseValue}) {
    super.props.addAll([elapseInSeconds, sleekCircularSliderElapseValue ?? 0]);
  }

}

class MainTimerStartedEvent extends MainEvent {}

class MainTimerResumedEvent extends MainEvent {}

class MainTimerPausedEvent extends MainEvent {}

class MainTimerResetEvent extends MainEvent {}

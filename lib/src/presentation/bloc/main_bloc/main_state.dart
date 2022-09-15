part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {
  late int elapseInSeconds;
  late double sleekCircularSliderElapseValue;

  @override
  List<Object> get props => [elapseInSeconds, sleekCircularSliderElapseValue];
}

class MainInitialState extends MainState {
  MainInitialState(
      {required int elapseInSeconds, required double sleekCircularSliderElapseValue}) {
    super.elapseInSeconds = elapseInSeconds;
    super.sleekCircularSliderElapseValue = sleekCircularSliderElapseValue;
  }

  MainInitialState copyWith(
      int? elapseInSeconds, double? sleekCircularSliderElapseValue) {
    return MainInitialState(
        elapseInSeconds: elapseInSeconds ?? this.elapseInSeconds,
        sleekCircularSliderElapseValue:
            sleekCircularSliderElapseValue ?? this.sleekCircularSliderElapseValue);
  }
}

class MainTimerRunInProgressState extends MainState {
  MainTimerRunInProgressState(
      {required int elapseInSeconds, required double sleekCircularSliderElapseValue}) {
    super.elapseInSeconds = elapseInSeconds;
    super.sleekCircularSliderElapseValue = sleekCircularSliderElapseValue;
  }
}

class MainTimerRunPauseState extends MainState {
  MainTimerRunPauseState(
      {required int elapseInSeconds, required double sleekCircularSliderElapseValue}) {
    super.elapseInSeconds = elapseInSeconds;
    super.sleekCircularSliderElapseValue = sleekCircularSliderElapseValue;
  }
}

class MainTimerInitialState extends MainState {
  MainTimerInitialState(
      {required int elapseInSeconds, required double sleekCircularSliderElapseValue}) {
    super.elapseInSeconds = elapseInSeconds;
    super.sleekCircularSliderElapseValue = sleekCircularSliderElapseValue;
  }
}

class MainStartOrPauseButtonState extends MainState {}

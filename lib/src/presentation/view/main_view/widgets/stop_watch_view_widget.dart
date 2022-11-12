import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../theming/app_theme.dart';
import '../../../../util/to_hours_minutes_seconds.dart';
import '../../../bloc/main_bloc/main_bloc.dart';

class StopWatchViewWidget extends StatelessWidget {
  const StopWatchViewWidget({Key? key, required this.max}) : super(key: key);
  final max;

  @override
  Widget build(BuildContext context) {
    final state = context.select((MainBloc bloc) {
      bloc.state.elapsedInSeconds > 0;
      return bloc.state;
    });
    return SizedBox(
      height: 180,
      width: 180,
      child: SleekCircularSlider(
        min: 0,
        max: (max - 1),
        initialValue: state.sleekCircularSliderElapsedValue,
        appearance: CircularSliderAppearance(
          size: 28,
          startAngle: 270,
          angleRange: 360,
          counterClockwise: true,
          animationEnabled: false,
          infoProperties: InfoProperties(
              mainLabelStyle: const TextStyle(fontSize: 36, fontWeight: FontWeight.w300),
              modifier: (double value) => toHoursMinutesSeconds(state.elapsedInSeconds)),
          customWidths: CustomSliderWidths(trackWidth: 2, progressBarWidth: 8),
          customColors: CustomSliderColors(
              trackColor: Colors.grey.shade200,
              progressBarColor: lightTheme.colorScheme.primary,
              shadowColor: lightTheme.colorScheme.primary,
              dotColor: Colors.white.withOpacity(0.8),
              shadowStep: 2,
              shadowMaxOpacity: 0.6),
        ),
      ),
    );
  }
}

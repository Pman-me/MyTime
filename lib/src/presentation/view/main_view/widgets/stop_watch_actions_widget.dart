import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theming/app_theme.dart';
import '../../../bloc/main_bloc/main_bloc.dart';

class StopWatchActionsWidget extends StatelessWidget {
  const StopWatchActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final state = context.select((MainBloc bloc) {
        bloc.state.isTimerRunInProgress;
        return bloc.state;
      });
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (!state.isTimerRunInProgress && state.elapsedInSeconds == 0) ...[
            playWidget(() => context.read<MainBloc>().add(MainTimerStartedEvent())),
          ],
          if (state.isTimerRunInProgress) ...[
            pauseWidget(() => context.read<MainBloc>().add(MainTimerPausedEvent())),
            resetWidget(() => context.read<MainBloc>().add(MainTimerResetEvent())),
          ],
          if (!state.isTimerRunInProgress && state.elapsedInSeconds > 0) ...[
            playWidget(() => context.read<MainBloc>().add(MainTimerResumedEvent())),
            resetWidget(() => context.read<MainBloc>().add(MainTimerResetEvent())),
          ],
        ],
      );
    });
  }

  Widget playWidget(VoidCallback callback) {
    return FloatingActionButton(
      backgroundColor: lightTheme.colorScheme.primary,
      heroTag: "playFab",
      mini: true,
      onPressed: callback,
      child: const Icon(Icons.play_arrow),
    );
  }

  Widget resetWidget(VoidCallback callback) {
    return FloatingActionButton(
      backgroundColor: lightTheme.colorScheme.primary,
      heroTag: "resetFab",
      mini: true,
      onPressed: callback,
      child: const Icon(Icons.replay),
    );
  }

  Widget pauseWidget(VoidCallback callback) {
    return FloatingActionButton(
      backgroundColor: lightTheme.colorScheme.primary,
      heroTag: "pauseFab",
      mini: true,
      onPressed: callback,
      child: const Icon(Icons.pause),
    );
  }
}

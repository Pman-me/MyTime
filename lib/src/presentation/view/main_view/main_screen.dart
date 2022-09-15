import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:my_time/src/theming/app_theme.dart';
import 'package:my_time/src/util/time_formatting.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocProvider.of<MainBloc>(context)..add(MainStartedEvent()),
      child: Scaffold(
        backgroundColor: lightTheme.colorScheme.background,
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(Icons.more_horiz_rounded),
          onPressed: () {},
        )),
        body: SizedBox.expand(
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TimeView(max: context.read<MainBloc>().hourInMinute),
                  const SizedBox(
                    height: 8,
                  ),
                  const TimeActions(),
                  const SizedBox(
                    height: 16,
                  ),
                  // const TimesListView(times: [1]),
                ],
              );
            },
          ),
        ),
        floatingActionButton: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return FloatingActionButton.extended(
              onPressed: () {
                context.read<MainBloc>().add(MainTimerResumedEvent());
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget buildTimeCard({required String time, required String header}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(header, style: const TextStyle(color: Colors.black45)),
        ],
      );
}

class TimeView extends StatelessWidget {
  const TimeView({Key? key, required this.max}) : super(key: key);
  final max;

  @override
  Widget build(BuildContext context) {
    double? sleekCircularSliderElapseValue;
    var elapseInSeconds = context.select((MainBloc bloc) {
      sleekCircularSliderElapseValue = bloc.state.sleekCircularSliderElapseValue;
      return bloc.state.elapseInSeconds;
    });

    return SizedBox(
      height: 220,
      width: 220,
      child: SleekCircularSlider(
        min: 0,
        max: (max - 1),
        initialValue: sleekCircularSliderElapseValue ?? 0,
        appearance: CircularSliderAppearance(
            size: 32,
            startAngle: 270,
            angleRange: 360,
            counterClockwise: true,
            animationEnabled: false,
            infoProperties: InfoProperties(
                mainLabelStyle:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
                modifier: (double value) => timeFormatting(elapseInSeconds)),
            customWidths: CustomSliderWidths(trackWidth: 2, progressBarWidth: 8),
            customColors: CustomSliderColors(
                trackColor: Colors.grey.shade200,
                progressBarColor: Colors.blue,
                shadowColor: Colors.blue,
                dotColor: Colors.white.withOpacity(0.8),
                shadowStep: 2,
                shadowMaxOpacity: 0.6)),
      ),
    );
  }
}

class TimeActions extends StatelessWidget {
  const TimeActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (state is MainInitialState) ...[
            playWidget(() => context.read<MainBloc>().add(MainTimerStartedEvent())),
          ],
          if (state is MainTimerRunInProgressState) ...[
            pauseWidget(() => context.read<MainBloc>().add(MainTimerPausedEvent())),
            resetWidget(() => context.read<MainBloc>().add(MainTimerResetEvent())),
          ],
          if (state is MainTimerRunPauseState) ...[
            playWidget(() => context.read<MainBloc>().add(MainTimerResumedEvent())),
            resetWidget(() => context.read<MainBloc>().add(MainTimerResetEvent())),
          ]
        ],
      ),
    );
  }

  Widget playWidget(VoidCallback callback) {
    return FloatingActionButton(
      heroTag: "fab1",
      onPressed: callback,
      child: const Icon(Icons.play_arrow),
    );
  }

  Widget resetWidget(VoidCallback callback) {
    return FloatingActionButton(
      heroTag: "fab2",
      onPressed: callback,
      child: const Icon(Icons.replay),
    );
  }

  Widget pauseWidget(VoidCallback callback) {
    return FloatingActionButton(
      heroTag: "fab3",
      onPressed: callback,
      child: const Icon(Icons.pause),
    );
  }
}

class TimesListView extends StatelessWidget {
  const TimesListView({Key? key, required this.times, this.itemExtend}) : super(key: key);
  final List times;
  final itemExtend;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemExtend * times.length,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemExtent: itemExtend,
          itemCount: times.length,
          itemBuilder: (context, index) => SizedBox(
                child: Column(
                  children: [
                    const Divider(height: 2),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}",
                        ),
                        Expanded(child: Text('00:15:36')),
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_time/src/presentation/view/main_view/widgets/time_list_widget.dart';

import '../../../bloc/main_bloc/main_bloc.dart';
import '../../add_detail_time_entry_view/add_detail_time_entry_widget.dart';
import 'stop_watch_actions_widget.dart';
import 'stop_watch_view_widget.dart';

class MainBodyWidget extends StatelessWidget {
  final AppLocalizations localizations;

  const MainBodyWidget({Key? key, required this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SizedBox.expand(
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            if (state.openBottomSheet) {
              _showBottomSheet(context);
            }
          },
          buildWhen: (previous, current) {
            if (previous.isTimeEntryListSending != current.isTimeEntryListSending) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    foregroundDecoration: state.isTimeEntryListSending
                        ? BoxDecoration(color: Colors.grey.withOpacity(0.5))
                        : null,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        StopWatchViewWidget(max: context.read<MainBloc>().hourInMinute),
                        const SizedBox(
                          height: 8,
                        ),
                        const StopWatchActionsWidget(),
                        const SizedBox(
                          height: 16,
                        ),
                        const TimeListWidget(itemExtend: 100),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: state.isTimeEntryListSending,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 4,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (BuildContext context) {
        return AddDetailTimeEntryWidget(
          localizations: localizations!,
        );
      },
    ).whenComplete(() => context.read<MainBloc>().add(MainCloseBottomSheetEvent()));
  }
}

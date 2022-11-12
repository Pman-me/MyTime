import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theming/app_theme.dart';
import '../../../bloc/main_bloc/main_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FabWidget extends StatelessWidget {
  final AppLocalizations localizations;

  const FabWidget({Key? key, required this.localizations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final canBeSaved = context.select((MainBloc bloc) {
          return bloc.state.canBeSaved;
        });
        return Positioned.fill(
          right: 0,
          left: 0,
          bottom: 16,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
              backgroundColor: lightTheme.colorScheme.primary,
              onPressed: () {
                canBeSaved!
                    ? context.read<MainBloc>().add(MainSaveTimeEntryEvent(
                        elapsedInSeconds:
                            context.read<MainBloc>().state.elapsedInSeconds))
                    : context.read<MainBloc>().add(MainOpenBottomSheetEvent());
              },
              icon: canBeSaved! ? const Icon(Icons.save_rounded) : const Icon(Icons.add),
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(canBeSaved ? localizations.save : localizations.add),
              ),
            ),
          ),
        );
      },
    );
  }
}

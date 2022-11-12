import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants/general_constant.dart';
import '../../../../domain/entities/workspace_entity.dart';
import '../../../../theming/app_theme.dart';
import '../../../bloc/main_bloc/main_bloc.dart';

class AppbarWidget extends StatelessWidget with PreferredSizeWidget {
  final AppLocalizations localizations;

  const AppbarWidget({Key? key, required this.localizations}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kAppbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      actions: [
        Builder(
          builder: (context) {
            final state = context.select((MainBloc bloc) {
              bloc.state.workspaces;
              return bloc.state;
            });
            return PopupMenuButton(
              offset: const Offset(0, kAppbarHeight),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      state.activeWorkspace?.name ?? '',
                      style: lightTheme.textTheme.bodyText1!.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 32,
                    ),
                  ],
                ),
              ),
              onSelected: (choice) {
                context.read<MainBloc>().add(
                    MainWorkspaceHasChangedEvent(selectedWorkspace: choice.toString()));
              },
              itemBuilder: (context) {
                return _popupMenuItems(state.workspaces!);
              },
            );
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.cloud_sync_rounded,
        ),
        onPressed: () {
          context.read<MainBloc>().add(MainPostTimeEntryList());
        },
      ),
    );
  }

  List<PopupMenuItem> _popupMenuItems(List<WorkspaceEntity> workspaces) {
    if (workspaces.isNotEmpty) {
      return workspaces.map((workspace) {
        return PopupMenuItem(
          value: workspace.name,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              workspace.name!,
              style: lightTheme.textTheme.subtitle2!.copyWith(fontSize: 16),
            ),
          ),
        );
      }).toList();
    } else {
      return [
        PopupMenuItem(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              localizations.no_found_workspace,
              style: lightTheme.textTheme.bodyText2!.copyWith(fontSize: 16),
            ),
          ),
        ),
      ];
    }
  }
}

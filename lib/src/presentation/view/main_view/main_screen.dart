import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:my_time/src/theming/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/general_constant.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/fab_widget.dart';
import 'widgets/main_body_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  AppLocalizations? localizations;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(MainStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    localizations ??= AppLocalizations.of(context);

    return Scaffold(
      key: kScaffoldKey,
      backgroundColor: lightTheme.colorScheme.background,
      appBar: AppbarWidget(localizations: localizations!),
      body: Stack(
        children: [
          MainBodyWidget(
            localizations: localizations!,
          ),
          FabWidget(localizations: localizations!),
        ],
      ),
    );
  }
}


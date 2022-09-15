import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/constants/general_constant.dart';
import 'package:my_time/src/presentation/bloc/config_bloc/config_bloc.dart';
import 'package:my_time/src/presentation/bloc/main_bloc/main_bloc.dart';

import 'src/constants/route_constant.dart';
import 'src/data/config_data/config_data_repository_impl.dart';
import 'src/data/config_data/config_remote_data_source.dart';
import 'src/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'src/routing/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/theming/app_theme.dart';

class MyTimeApp extends StatelessWidget {
  const MyTimeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
          lazy: true,
        ),
        BlocProvider(
            create: (context) =>
                MainBloc(timerMethodChannel: const MethodChannel(kTimerMethodChannel))),
        BlocProvider(
          create: (context) => ConfigBloc(
              configDataRepositoryImpl:
                  RepositoryProvider.of<ConfigDataRepositoryImpl>(context)),
          lazy: true,
        ),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => ConfigRemoteDataSource.create(),
            lazy: true,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          initialRoute: kSplashScreenRoute,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}

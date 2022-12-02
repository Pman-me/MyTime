import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/constants/general_constant.dart';
import 'package:my_time/src/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:my_time/src/presentation/bloc/add_delete_time_entry_bloc/add_detail_time_entry_bloc.dart';

import 'locator.dart';
import 'src/constants/route_constant.dart';
import 'src/presentation/bloc/api_key_bloc/api_key_bloc.dart';
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
          create: (_) => locator<SplashBloc>(),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => locator<MainBloc>(),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => locator<ApiKeyBloc>(),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => locator<AddDetailTimeEntryBloc>(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        navigatorKey: kNavigatorKey,
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
    );
  }
}

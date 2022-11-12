import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/gen/assets.gen.dart';
import 'package:my_time/src/constants/general_constant.dart';
import 'package:my_time/src/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:my_time/src/routing/app_routes.dart';
import 'package:my_time/src/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:my_time/src/theming/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppLocalizations? localizations;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<SplashBloc>(context).add(SplashStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    localizations ??= AppLocalizations.of(context);

    return BlocConsumer<SplashBloc, SplashState>(
      buildWhen: (previous, current) {
        if (current is SplashNavigatedTo) {
          return false;
        } else {
          return true;
        }
      },
      listener: (context, state) {
        if (state is SplashNavigatedTo) {
          _navigatedToApiKeyScreen(state.route);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(child: Assets.images.splashScreen.image(fit: BoxFit.cover)),
              Positioned(
                right: 0,
                left: 0,
                bottom: 8,
                child: Visibility(
                  visible: !state.networkConnectivity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_outlined,
                        color: lightTheme.colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<SplashBloc>().add(SplashRetryEvent());
                        },
                        child: Text(
                          localizations!.retry,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _navigatedToApiKeyScreen(String route) {
    kNavigatorKey.currentState!
        .pushReplacement(AppRoutes.generateRoute(RouteSettings(name: route)));
  }
}

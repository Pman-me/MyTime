import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/gen/assets.gen.dart';
import 'package:my_time/src/routing/app_routes.dart';
import 'package:my_time/src/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:my_time/src/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:my_time/src/presentation/bloc/splash_bloc/splash_state.dart';

import '../../../constants/route_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocProvider.of<SplashBloc>(context)..add(SplashStarted()),
      child: BlocConsumer<SplashBloc, SplashState>(
        buildWhen: (previous, current) {
          if (current is SplashNavigated) {
            return false;
          } else {
            return true;
          }
        },
        listener: (context, state) {
          if (state is SplashNavigated) {
            Navigator.pushReplacement(context,
                AppRoutes.generateRoute(const RouteSettings(name: kMainScreenRoute)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SizedBox.expand(
                child: Assets.images.splashScreen.image(fit: BoxFit.cover)),
          );
        },
      ),
    );
  }
}

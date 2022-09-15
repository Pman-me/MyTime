import 'package:flutter/material.dart';
import 'package:my_time/src/presentation/view/config_view/config_screen.dart';

import '../constants/route_constant.dart';
import '../presentation/view/main_view/main_screen.dart';
import '../presentation/view/splash_view/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var route;

    switch (settings.name) {
      case kSplashScreenRoute:
        route = MaterialPageRoute(builder: (_) => const SplashScreen());
        break;
      case kMainScreenRoute:
        route = MaterialPageRoute(builder: (_) => const MainScreen());
        break;
      case kConfigScreenRoute:
        route = MaterialPageRoute(builder: (_) => ConfigScreen());
        break;
    }
    return route;
  }
}

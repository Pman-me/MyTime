import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_time/locator.dart';
import 'package:my_time/my_time_app.dart';
import 'life_cycle.dart';

void main() {
  _startSetup();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(
        LifeCycle(
          child: const MyTimeApp(),
        ),
      ));
}

Future<void> _startSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
}

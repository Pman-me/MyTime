import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_time/src/presentation/bloc/splash_bloc/splash_event.dart';
import 'package:my_time/src/presentation/bloc/splash_bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashStarted>(_onStarted);
  }

  _onStarted(SplashStarted event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) =>
        emit(SplashNavigated())
    );
  }
}

part of 'splash_bloc.dart';

@immutable
class SplashState extends Equatable {
  bool networkConnectivity;

  SplashState({this.networkConnectivity = true});

  @override
  List<Object?> get props => [networkConnectivity];
}

class SplashNavigatedTo extends SplashState {
  String route;

  SplashNavigatedTo({required this.route});
}

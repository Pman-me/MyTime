import 'dart:async';

class CustomTicker {
  static CustomTicker? instance;

  CustomTicker._internal();

  factory CustomTicker() {
    return instance ??= CustomTicker._internal();
  }

  Stream<int> tick() {
    return Stream.periodic(const Duration(seconds: 1), (x) => x).asBroadcastStream();
  }
}

String timeFormatting(int elapsedTime) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  var elapseTimeToDuration = Duration(seconds: elapsedTime);
  final hours = twoDigits(elapseTimeToDuration.inHours);
  final minutes = twoDigits((((elapseTimeToDuration.inSeconds / 60) % 60).floor()));
  final seconds = twoDigits(elapseTimeToDuration.inSeconds % 60.floor());

  return '$hours:$minutes:$seconds';
}
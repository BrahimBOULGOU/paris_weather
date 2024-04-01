extension IntExtension on int {
  DateTime toDateTime() =>
      DateTime.fromMillisecondsSinceEpoch(this * 1000, isUtc: true);
}

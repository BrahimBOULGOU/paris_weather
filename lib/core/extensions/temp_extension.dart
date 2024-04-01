extension DateTimeExtension on double {
  String toCelsius() => '${(this - 273.15).round()} °C';
}

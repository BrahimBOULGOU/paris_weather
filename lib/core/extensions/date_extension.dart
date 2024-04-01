import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString() => DateFormat(' MMM dd, yyyy hh:mm').format(this);
}

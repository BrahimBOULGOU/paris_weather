import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toTimeString() => DateFormat('hh:mm').format(this);
  String toDateString() => DateFormat('MMM dd, yyyy').format(this);
}

// ignore_for_file: unnecessary_this
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String getCurrentDateFormatted() {
    DateFormat formatter = DateFormat('MMMM dd, yyyy');
    return formatter.format(this);
  }
}

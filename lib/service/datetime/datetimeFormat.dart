import 'package:intl/intl.dart';

String? datetimeFormat(datetime) {
  return datetime == '' || datetime == null
      ? ''
      : DateFormat('MMM d, y').format(DateTime.parse(datetime));
}

import 'package:intl/intl.dart';

String? datetimeFormat(datetime) {
  return DateFormat('MMM d, y').format(datetime.toDate());
}

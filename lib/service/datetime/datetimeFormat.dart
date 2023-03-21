import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String? datetimeFormat(datetime) {
  return DateFormat('MMM d, y').format(
      datetime == Timestamp ? datetime.toDate() : DateTime.parse(datetime));
}

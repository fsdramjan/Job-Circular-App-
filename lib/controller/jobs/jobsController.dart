import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class JobsController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllJobs() {
    return _firestore
        .collection('jobs')
        .orderBy(
          'time',
          descending: false,
        )
        .snapshots();
  }
}

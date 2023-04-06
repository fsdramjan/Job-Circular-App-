import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getSettingsInfo() {
    return _firestore.collection('settings').snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllCategory() {
    return _firestore
        .collection('jobCategoryList')
        .orderBy(
          'time',
          descending: false,
        )
        .snapshots();
  }
}

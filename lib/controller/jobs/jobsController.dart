import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/jobs/jobsModel.dart';

class JobsController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  final searchText = TextEditingController().obs;

  var perPage = RxInt(1);
  var circularJobPerPage = RxInt(1);
  var preparationJobPerPage = RxInt(1);
  var categoryWisePerPage = RxInt(1);

  DocumentSnapshot? lastDocument;
  bool hasMoreData = true;

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllJobs() {
    return _firestore
        .collection('jobs')
        .orderBy(
          'time',
          descending: false,
        )
        .limit(perPage.value)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getLatestJobCircular() {
    return _firestore
        .collection('jobs')
        .where("isJobCircular", isEqualTo: 'true')
        .limit(circularJobPerPage.value)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getJobPreparation() {
    return _firestore
        .collection('jobs')
        .where("isJobPreparation", isEqualTo: 'true')
        .limit(preparationJobPerPage.value)
        .snapshots();
  }

  getMoreAllJobs() {
    perPage.value = perPage.value + 1;
  }

  getMoreLatestCircularJob() {
    circularJobPerPage.value = circularJobPerPage.value + 1;
  }

  getMorePreparationJob() {
    preparationJobPerPage.value = preparationJobPerPage.value + 1;
  }

  getMoreCategoryWiseJob() {
    categoryWisePerPage.value = categoryWisePerPage.value + 1;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> categoryWiseJob(
      String? categoryId) {
    return _firestore
        .collection("jobs")
        .where("categoryId", isEqualTo: categoryId)
        .limit(categoryWisePerPage.value)
        .snapshots();
  }

  Future<List<JobsModel>> searchJob() async {
    List<JobsModel> jobList = [];
    try {
      await _firestore
          .collection('jobs')
          .where('search', arrayContains: searchText.value.text.toLowerCase())
          .orderBy('time', descending: true)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          JobsModel item = JobsModel.fromDocumentSnapshot(element);
          jobList.add(item);
        });
        return value.docs[0];
      });
      return jobList;
    } catch (e) {
      print(e);
      return [];
    }
  }
  // Stream<QuerySnapshot<Map<String, dynamic>>> searchJob() {
  //   return _firestore
  //       .collection('jobs')
  //       .where('search', arrayContains: searchText.text.toLowerCase())
  //       .orderBy('time', descending: true)
  //       .snapshots();
  // }
}

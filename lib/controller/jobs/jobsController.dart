import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/controller/auth/authController.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/dialog/loadingDialog.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/pages/home/homePage.dart';

import '../../model/jobs/jobsModel.dart';

class JobsController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  final searchText = TextEditingController().obs;

  final phoneText = TextEditingController().obs;
  final descriptionText = TextEditingController().obs;

  var pageValueExtend = 5;

  var perPage = RxInt(5);
  var circularJobPerPage = RxInt(5);
  var preparationJobPerPage = RxInt(5);
  var categoryWisePerPage = RxInt(5);
  var otherategoryWisePerPage = RxInt(5);

  DocumentSnapshot? lastDocument;
  bool hasMoreData = true;
  clear() {
    final _ = AllController();

    _.authC.name.value.text = '';
    _.authC.email.value.text = '';
    phoneText.value.text = '';
    descriptionText.value.text = '';
    _.fileUploadC.selectedFile.value = '';
    _.fileUploadC.selectedFileName.value = '';
    _.fileUploadC.selectedImage.value = '';
  }

  applyForJob(
    String? jobId,
    String? jobName,
  ) async {
    try {
      loadingDialog();
      final id = _firestore.collection('appliedJobs').doc().id.toString();

      final _ = AllController();
      await _firestore.collection('appliedJobs').doc(id).set({
        'id': '$id',
        'jobId': '$jobId',
        'jobName': '$jobName',
        'userId': userId().toString(),
        'name': _.authC.name.value.text,
        'email': _.authC.email.value.text,
        'phone': _.authC.phoneController.text,
        'description': descriptionText.value.text,
        'file': _.fileUploadC.selectedFile.value,
        'fileName': _.fileUploadC.selectedFileName.value,
        'status': 'Pending',
        'profilePic': _.fileUploadC.selectedImage.value,
        'time': DateTime.now().toString(),
      });
      if (id != '') {
        snackbar('Job Applied Successfully!!');
        clear();
        Get.offAll(HomePage());
      }
    } catch (e) {
      print(e);
      Get.back();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMyAppliedJobs() {
    return _firestore
        .collection('appliedJobs')
        .where(
          'userId',
          isEqualTo: userId().toString(),
        )
        .orderBy(
          'time',
          descending: false,
        )
        .snapshots();
  }

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

  Stream<QuerySnapshot<Map<String, dynamic>>> getSingleJobs(String? jobId) {
    return _firestore
        .collection('jobs')
        .where('id', isEqualTo: jobId.toString())
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
    perPage.value = perPage.value + pageValueExtend;
  }

  getMoreLatestCircularJob() {
    circularJobPerPage.value = circularJobPerPage.value + pageValueExtend;
  }

  getMorePreparationJob() {
    preparationJobPerPage.value = preparationJobPerPage.value + pageValueExtend;
  }

  getMoreCategoryWiseJob() {
    categoryWisePerPage.value = categoryWisePerPage.value + pageValueExtend;
  }

  getMoreOtherCategoryWisePost() {
    otherategoryWisePerPage.value =
        otherategoryWisePerPage.value + pageValueExtend;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> categoryWiseJob(
      String? categoryId) {
    return _firestore
        .collection("jobs")
        .where("categoryId", isEqualTo: categoryId)
        .limit(categoryWisePerPage.value)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> otherCategoryWisePost(
      String? categoryId) {
    return _firestore
        .collection("otherCategoryPost")
        .where("categoryId", isEqualTo: categoryId)
        .limit(otherategoryWisePerPage.value)
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

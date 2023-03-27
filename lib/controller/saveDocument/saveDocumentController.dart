import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../service/dialog/loadingDialog.dart';
import '../auth/authController.dart';

class SaveDocumentController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final saveDocument = 'saveDocument';

  //for save password
  final title = TextEditingController();
  final password = TextEditingController();
  //

  Future<File> downloadFile(String url, String filename) async {
    var httpClient = http.Client();
    var request = http.Request('GET', Uri.parse(url));
    var response = await httpClient.send(request);

    var bytes = await response.stream.toBytes();
    var dir = await getExternalStorageDirectory();
    File file = File('${dir!.path}/$filename');
    await file.writeAsBytes(bytes);

    return file;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCvFile() {
    return _firestore
        .collection(saveDocument)
        .where(
          'userId',
          isEqualTo: userId().toString(),
        )
        .orderBy('time', descending: true)
        .where('documentType', isEqualTo: 'CV')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSavePassword() {
    return _firestore
        .collection(saveDocument)
        .where(
          'userId',
          isEqualTo: userId().toString(),
        )
        .orderBy('time', descending: true)
        .where('documentType', isEqualTo: 'Password')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSaveAdmitCard() {
    return _firestore
        .collection(saveDocument)
        .where(
          'userId',
          isEqualTo: userId().toString(),
        )
        .orderBy('time', descending: true)
        .where('documentType', isEqualTo: 'AdmitCard')
        .snapshots();
  }

  addCv(
    String documentType, {
    String? successMessage,
  }) async {
    try {
      var id = _firestore.collection(saveDocument).doc().id.toString();
      final _ = AllController();

      if (_.fileUploadC.selectedFile.value != '') {
        loadingDialog(loadingText: 'Uploading File...');

        final data = {
          'id': id,
          'file': _.fileUploadC.selectedFile.value,
          'fileName': _.fileUploadC.selectedFileName.value,
          'time': DateTime.now().toString(),
          'userName': _.authC.name.value.text,
          'profilePic': _.fileUploadC.selectedImage.value,
          'userId': userId().toString(),
          'documentType': documentType,
        };
        if (id != '') {
          await _firestore.collection(saveDocument).doc(id).set(data);
          snackbar(successMessage ?? 'File Added!!');
          _.fileUploadC.selectedFile.value = '';
          _.authC.clear(isProfileInfo: true);
          Get.back();
        }
      }
    } catch (e) {
      print(e);

      Get.back();
    }
  }

  deleteSavedFile(
    String id, {
    String? successMessage,
  }) async {
    loadingDialog();
    try {
      await _firestore.collection(saveDocument).doc(id).delete();

      if (id != '') {
        snackbar(successMessage ?? 'File removed!!');
        Get.back();
      }
    } catch (e) {
      Get.back();

      print(e);
    }
  }
}

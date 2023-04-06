import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/dialog/loadingDialog.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';

import '../model/skillsModel.dart';

class JobProfileController extends GetxController {
  final _auth = FirebaseAuth.instance;
  // final _firestore = FirebaseFirestore.instance;

  final fullName = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final dateOfBirth = TextEditingController();
  final dob = TextEditingController();
  final gender = TextEditingController().obs;
  final feetH = TextEditingController();
  final inchesH = TextEditingController();
  final religion = TextEditingController().obs;
  final martialStatus = TextEditingController().obs;
  final nationalIdNo = TextEditingController();
  final passportNo = TextEditingController();
  final mobileNumber = TextEditingController();
  final confirmMobileNumber = TextEditingController();
  final email = TextEditingController();
  final quota = TextEditingController().obs;

  final careOf = TextEditingController();
  final village = TextEditingController();
  final district = TextEditingController().obs;
  final upazila = TextEditingController().obs;
  final postOffice = TextEditingController().obs;
  final postCode = TextEditingController();

  final careOfP = TextEditingController();
  final villageP = TextEditingController();
  final districtP = TextEditingController().obs;
  final upazilaP = TextEditingController().obs;
  final postOfficeP = TextEditingController().obs;
  final postCodeP = TextEditingController();

  final upazilaId = RxString('');
  final districtId = RxString('');
  final postOfficeId = RxString('');

  final upazilaIdP = RxString('');
  final districtIdP = RxString('');
  final postOfficeIdP = RxString('');

  final isSameAsPresentAddress = RxBool(false);

  final examination = TextEditingController().obs;
  final board = TextEditingController().obs;
  final passingYear = TextEditingController().obs;

  final roll = TextEditingController().obs;
  final registrationNo = TextEditingController().obs;
  final result = TextEditingController().obs;

  final isNotApplicable = RxBool(false);

  final skillsList = RxList<SkillsModel>();

  final institutionName = TextEditingController();
  final computerLiteracy = TextEditingController();
  final duration = TextEditingController();
  final resultSkills = TextEditingController();

  final jobType = TextEditingController();
  final companyName = TextEditingController();
  final location = TextEditingController();
  final designation = TextEditingController();
  final presentSalary = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();

  final iCurrentlyWorkInThisRole = RxBool(false);
  final isIDonthaveAny = RxBool(false);

  final profile = TextEditingController();
  final signature = TextEditingController();
  final nid = TextEditingController();
  final passport = TextEditingController();
  final birthCertificate = TextEditingController();
  final certificate = TextEditingController();

  clear() {
    fullName.clear();
    fatherName.clear();
    motherName.clear();
    dateOfBirth.clear();
    gender.value.clear();
    feetH.clear();
    inchesH.clear();
    religion.value.clear();
    martialStatus.value.clear();
    nationalIdNo.clear();
    passportNo.clear();
    mobileNumber.clear();
    confirmMobileNumber.clear();
    email.clear();
    quota.value.clear();
    dob.clear();
    jobType.clear();
    companyName.clear();
    location.clear();
    designation.clear();
    presentSalary.clear();
    startDate.clear();
    endDate.clear();
    iCurrentlyWorkInThisRole.value = false;
    isIDonthaveAny.value = false;
  }

  final basicInfoDB = FirebaseFirestore.instance
      .collection('jobProfile')
      .doc('1eqYJxn14QNy0EzZUINa')
      .collection('basicInfo');

  final addressDB = FirebaseFirestore.instance
      .collection('jobProfile')
      .doc('1eqYJxn14QNy0EzZUINa')
      .collection('address');

  final educationDB = FirebaseFirestore.instance
      .collection('jobProfile')
      .doc('1eqYJxn14QNy0EzZUINa')
      .collection('education');

  final skillsDB = FirebaseFirestore.instance
      .collection('jobProfile')
      .doc('1eqYJxn14QNy0EzZUINa')
      .collection('skills');

  final imagesDB = FirebaseFirestore.instance
      .collection('jobProfile')
      .doc('1eqYJxn14QNy0EzZUINa')
      .collection('images');

  Stream<QuerySnapshot<Map<String, dynamic>>> getBasicInfo() {
    return basicInfoDB
        .where(
          'userId',
          isEqualTo: _auth.currentUser!.uid,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAddress() {
    return addressDB
        .where(
          'userId',
          isEqualTo: _auth.currentUser!.uid,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEducation() {
    return educationDB
        .where(
          'userId',
          isEqualTo: _auth.currentUser!.uid,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getImages() {
    return imagesDB
        .where(
          'userId',
          isEqualTo: _auth.currentUser!.uid,
        )
        .snapshots();
  }

  addBasicInfo() async {
    try {
      loadingDialog();
      // final id = basicInfoDB.doc().id.toString();

      await basicInfoDB.doc(_auth.currentUser!.uid).set({
        // 'id': _auth.currentUser!.uid,
        'userId': _auth.currentUser!.uid,
        'fullName': fullName.text,
        'fatherName': fatherName.text,
        'motherName': motherName.text,
        'dateOfBirth': dateOfBirth.text,
        'gender': gender.value.text,
        'feetH': feetH.text,
        'inchesH': inchesH.text,
        'religion': religion.value.text,
        'martialStatus': martialStatus.value.text,
        'nationalIdNo': nationalIdNo.text,
        'passportNo': passportNo.text,
        'mobileNo': mobileNumber.text,
        'confirmMobileNumber': confirmMobileNumber.text,
        'email': email.text,
        'quota': quota.value.text,
        'time': DateTime.now().toString(),
      });

      if (_auth.currentUser!.uid != '') {
        snackbar('Basic Info Added!!');
        clear();
        Get.back();
        Get.back();
      }
    } on FirebaseException catch (e) {
      print(e.message);
      Get.back();
    }
  }

  addAddress() async {
    try {
      loadingDialog();
      // final id = basicInfoDB.doc().id.toString();

      await addressDB.doc(_auth.currentUser!.uid).set({
        // 'id': _auth.currentUser!.uid,
        'userId': _auth.currentUser!.uid,
        'careOf': careOf.text,
        'village': village.text,
        'postalCode': postCode.text,
        'postOffice': postOffice.value.text,
        'postOfficeId': postOfficeId.value,
        'district': district.value.text,
        'districtId': districtId.value,
        'upazila': upazila.value.text,
        'upazilaId': upazilaId.value,
        'isSameAsPresentAddress': isSameAsPresentAddress.value,
        'careOfP': careOfP.text,
        'villageP': villageP.text,
        'postalCodeP': postCodeP.text,
        'postOfficeP': postOfficeP.value.text,
        'districtP': districtP.value.text,
        'upazilaP': upazilaP.value.text,
        'postOfficeIdP': postOfficeIdP.value,
        'districtIdP': districtIdP.value,
        'upazilaIdP': upazilaIdP.value,
        'time': DateTime.now().toString(),
      });

      if (_auth.currentUser!.uid != '') {
        snackbar('Basic Info Added!!');
        clear();
        Get.back();
        Get.back();
      }
    } on FirebaseException catch (e) {
      print(e.message);
      Get.back();
    }
  }

  addEducationInfo() async {
    try {
      loadingDialog();

      await educationDB.doc(_auth.currentUser!.uid).set({
        'userId': _auth.currentUser!.uid,
        'passingYear': passingYear.value.text,
        'roll': roll.value.text,
        'result': result.value.text,
        'registrationNo': registrationNo.value.text,
        'isNotApplicable': isNotApplicable.value,
        'examination': examination.value.text,
        'board': board.value.text,
        'time': DateTime.now().toString(),
      });

      if (_auth.currentUser!.uid != '') {
        snackbar('Basic Info Added!!');
        clear();
        Get.back();
        Get.back();
      }
    } on FirebaseException catch (e) {
      print(e.message);
      Get.back();
    }
  }

  addSkillsInfo() async {
    try {
      loadingDialog();

      await skillsDB.doc(_auth.currentUser!.uid).set({
        'userId': _auth.currentUser!.uid,
        'computerLiteracy': computerLiteracy.text,
        'institutionName': institutionName.text,
        'result': resultSkills.text,
        'duration': duration.text,
        'iDontHaveAny': isIDonthaveAny.value,
        'iCurrentlyWorkInThisRole': iCurrentlyWorkInThisRole.value,
        'jobType': jobType.text,
        'companyName': companyName.text,
        'location': location.text,
        'designation': designation.text,
        'presentSalary': presentSalary.text,
        'startDate': startDate.text,
        'endDate':
            iCurrentlyWorkInThisRole.value == true ? 'Present' : endDate.text,
        'time': DateTime.now().toString(),
      });

      if (_auth.currentUser!.uid != '') {
        snackbar('Skills Added!!');
        clear();
        Get.back();
        Get.back();
        Get.back();
      }
    } on FirebaseException catch (e) {
      print(e.message);
      Get.back();
    }
  }

  addImages() async {
    try {
      // loadingDialog();

      await imagesDB.doc(_auth.currentUser!.uid).set({
        'userId': _auth.currentUser!.uid,
        'profile': profile.text,
        'signature': signature.text,
        'nid': nid.text,
        'passport': passport.text,
        'birthCertificate': birthCertificate.text,
        'certificate': certificate.text,
        'time': DateTime.now().toString(),
      });

      if (_auth.currentUser!.uid != '') {
        snackbar('Image Added!!');
        clear();
        // Get.back();
        // Get.back();
        // Get.back();
      }
    } on FirebaseException catch (e) {
      print(e.message);
      Get.back();
    }
  }
}

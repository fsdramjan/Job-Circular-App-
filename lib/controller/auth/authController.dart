import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_circular_app/model/profile/profileModel.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/dialog/loadingDialog.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/pages/auth/loginPage.dart';
import 'package:job_circular_app/view/pages/auth/registerPage.dart';
import 'package:job_circular_app/view/pages/home/homePage.dart';

String? userId() {
  final _auth = FirebaseAuth.instance;
  print(_auth.currentUser.toString());
  var id =
      _auth.currentUser == null ? 'Login as guest!!' : _auth.currentUser!.uid;

  return id;
}

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  // final uid = getStorage.read(userUid);

  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final name = TextEditingController().obs;

  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  String? verificationId;
  var endTime = RxInt(0);

  clear({
    bool isProfileInfo = false,
  }) {
    final _ = AllController();
    if (isProfileInfo == true) {
      email.value.clear();
      password.value.clear();
      codeController.clear();
      _.saveDocumentC.title.clear();
      _.saveDocumentC.password.clear();
      _.fileUploadC.selectedFile.value = '';
      _.fileUploadC.selectedFileName.value = '';
    } else {
      email.value.clear();
      password.value.clear();
      codeController.clear();
      name.value.clear();
      _.fileUploadC.selectedImage.value = '';
      _.fileUploadC.selectedFile.value = '';
      _.fileUploadC.selectedFileName.value = '';
    }
  }

  sendOTP() {
    submitPhoneNumber().then((value) {
      endTime.value = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    });
  }

  Future<void> submitPhoneNumber() async {
    // await loadingDialog();

    final String phone = "+880" + phoneController.text.trim();
    await getStorage.write(phoneNumberL, phone);

    print(phone);
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration(seconds: 30),
      verificationCompleted: (AuthCredential credential) async {
        await _auth.signInWithCredential(credential);

        print('OTP Code: ${credential.providerId}');
        // Handle authentication success
      },
      verificationFailed: (FirebaseAuthException e) {
        // Get.back();

        // Handle verification failure
        snackbar(e.message.toString(), bgColor: red);
        print('Failed: ${e.toString()}');
      },
      codeSent: (String? _verificationId, int? resendToken) {
        snackbar('Code sent to $phone');

        verificationId = _verificationId;
      },
      codeAutoRetrievalTimeout: (String _verificationId) {
        // snackbar('Your verification id is $verificationId', bgColor: red);

        verificationId = _verificationId;
        // Get.back();
      },
    );
  }

  Future<void> submitVerificationCode() async {
    loadingDialog(loadingText: 'Verifying....');
    final String phone = "+880" + phoneController.text.trim();

    final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.toString(),
        smsCode: codeController.text);
    try {
      await _auth.signInWithCredential(credential);

//user exist check
      getAllUsers().then((value) {
        Get.back();
        value.map((e) async {
          print('${e.phone.toString().contains(phone)}==$phone');
          if (e.phone.toString().contains(phone)) {
            snackbar('Login Success!!');
            phoneController.clear();
            await getStorage.erase();
            Get.offAll(HomePage());
          } else {
            // snackbar('Please add your profile info!!');

            Get.to(RegisterPage());
          }
        }).toList();
      });

      // Handle authentication success
    } on FirebaseException catch (e) {
      Get.back();

      // Handle authentication failure
      snackbar(e.message, bgColor: red);

      print(e.toString());
    }
  }

  createNewUser() async {
    try {
      loadingDialog();
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.value.text,
        password: password.value.text,
      );

      if (userCredential.user != null) {
        print(userCredential.user!.uid);
        // getStorage.write(userUid, userCredential.user!.uid.toString());

        snackbar('User registration success!!');
        // addUserInfo(userCredential.user!.uid, userCredential.credential!.token);
        clear();

        Get.offAll(HomePage());
      }
    } on FirebaseAuthException catch (e) {
      Get.back();

      if (e.code == 'weak-password') {
        snackbar(
          'The password provided is too weak.',
          bgColor: red,
        );
      } else if (e.code == 'email-already-in-use') {
        snackbar(
          'The account already exists for that email.',
          bgColor: red,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  login() async {
    try {
      loadingDialog();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.value.text,
        password: password.value.text,
      );
      print(email.value.text);
      print(password.value.text);
      print(userCredential.user);

      if (userCredential.user != null) {
        print(userCredential.user!.uid);
        // getStorage.write(userUid, userCredential.user!.uid.toString());
        print('Login Done');
        clear();

        snackbar('User login success!!');
        Get.offAll(HomePage());
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'user-not-found') {
        snackbar(
          'No user found for that email.',
          bgColor: red,
        );
      } else if (e.code == 'wrong-password') {
        snackbar(
          'Wrong password provided for that user.',
          bgColor: red,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  sendResetEmail(context) async {
    loadingDialog();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.value.text);
      // Password reset email sent
      Navigator.pop(context);
      snackbar('Password reset email sent!!');
      clear();
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        snackbar('No user found for that email.', bgColor: red);
      }
    } catch (e) {
      Navigator.pop(context);

      print(e);
    }
  }

  addUserInfo({bool isHideRoute = false}) async {
    try {
      loadingDialog();

      var id = _auth.currentUser!.uid;

      print(_auth.currentUser.toString());
      final _ = AllController();

      await _firestore.collection('users').doc(id).set({
        'id': id,
        'name': name.value.text,
        'email': email.value.text,
        'phone': phoneController.text,
        'time': DateTime.now().toString(),
        'image': _.fileUploadC.selectedImage.toString(),
      });
      _.fileUploadC.selectedImage.value = '';
      id = '';
      // token = null;
      name.value.clear();
      email.value.clear();
      phoneController.clear();
      if (isHideRoute == true) {
      } else {
        await getStorage.erase();

        Get.offAll(HomePage());
      }
    } catch (e) {
      print(e);
      Get.back();
    }
  }

  signout() async {
    clear();

    print('User ID Auth : $userId()');

    await _auth.signOut();
    Get.offAll(LoginPage());
  }

  void removeCurrentUser() async {
    loadingDialog();
    User user = _auth.currentUser as User;

    try {
      await user.delete();
      snackbar('User deleted successfully.');
      await deleteUserInfo();
      // getStorage.remove(userUid);
      clear();
      Get.offAll(LoginPage());
    } catch (e) {
      snackbar('Error deleting user: $e', bgColor: red);
      Get.back();
    }
  }

  Future deleteUserInfo() async {
    try {
      // final uid = getStorage.read(userUid);

      await _firestore.collection('users').doc(userId().toString()).delete();
    } catch (e) {
      print(e);
    }
  }

  updateProfile() async {
    try {
      loadingDialog();
      final _ = AllController();

      final data = {
        'id': userId().toString(),
        'name': name.value.text,
        'email': email.value.text,
        'time': DateTime.now().toString(),
        'image': _.fileUploadC.selectedImage.toString(),
      };

      if (userId().toString() != '') {
        await _firestore
            .collection('users')
            .doc(userId().toString())
            .update(data);
        snackbar('Profile Updated!!');
        Get.back();
        Get.back();
      }
    } catch (e) {
      print(e);
      Get.back();
    }
  }

  Future<List<ProfileModel>> getProfileInfo() async {
    List<ProfileModel> profileInfo = [];
    // final uid = getStorage.read(userUid);

    try {
      await _firestore
          .collection('users')
          .where('id', isEqualTo: userId().toString())
          .get()
          .then((value) {
        value.docs.forEach((element) {
          ProfileModel item = ProfileModel.fromDocumentSnapshot(element);
          profileInfo.add(item);
        });
        return value.docs[0];
      });
      return profileInfo;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<ProfileModel>> getAllUsers() async {
    List<ProfileModel> profileInfo = [];
    // final uid = getStorage.read(userUid);

    try {
      await _firestore.collection('users').get().then((value) {
        value.docs.forEach((element) {
          ProfileModel item = ProfileModel.fromDocumentSnapshot(element);
          profileInfo.add(item);
        });
        return value.docs[0];
      });
      return profileInfo;
    } catch (e) {
      print(e);
      return [];
    }
  }
}

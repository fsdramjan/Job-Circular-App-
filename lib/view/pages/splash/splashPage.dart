import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/controller/auth/authController.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/pages/auth/loginPage.dart';
import 'package:job_circular_app/view/pages/auth/registerPage.dart';
import 'package:job_circular_app/view/pages/home/homePage.dart';

class SplashPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_) {
      final _auth = FirebaseAuth.instance;

      if (_auth.currentUser == null) {
        Get.offAll(LoginPage());
      } else {
        print('User Id : ${userId().toString()}');

        authC.getAllUsers().then((value) {
          value.map((e) {
            print(e.id.toString().contains(_auth.currentUser!.uid));

            // if (e.id.toString().contains(_auth.currentUser!.uid)) {
            //   Get.offAll(HomePage());
            // }
            if (getStorage.read(phoneNumberL) == null ||
                getStorage.read(phoneNumberL) == '') {
              Get.offAll(HomePage());
            } else {
              print(
                  '${getStorage.read(phoneNumberL) != null} ${getStorage.read(phoneNumberL)}');

              Get.offAll(RegisterPage());
            }
          }).toList();
        });
      }
    });

    return Scaffold(
        body: Center(
      child: FlutterLogo(
        size: 120,
      ),
    ));
  }
}

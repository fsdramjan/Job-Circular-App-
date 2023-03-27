import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/view/pages/auth/loginPage.dart';
import 'package:job_circular_app/view/pages/home/homePage.dart';

import '../../../controller/auth/authController.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_) {
      if (userId().toString() != '') {
        Get.offAll(HomePage());
      } else {
        Get.offAll(LoginPage());
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

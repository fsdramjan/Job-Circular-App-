import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class ForgetPasswordPage extends StatelessWidget with AllController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: sidebarComponent(),
      // appBar: cAppBar(title: 'Login'),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            sizeH10,

            Padding(
              padding: EdgeInsets.only(top: Get.height / 10),
              child: FlutterLogo(
                size: 100,
              ),
            ),
            sizeH10,
            KText(
              text: 'Email',
            ),
            sizeH10,
            cFormField(
              height: 45,
              borderColor: grey,
              hintText: 'Enter your email',
              fontSize: 16,
              controller: authC.email.value,
              contentPadding: paddingH10,
            ),

            sizeH20,
            customCard(
              color: green,
              height: 40,
              borderRadiusC: 10,
              onTap: () => authC.sendResetEmail(context),
              child: Center(
                child: KText(
                  text: 'Send Code',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ),
            // sizeH5,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: KText(
                    text: 'Back',
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
              ],
            ),
            sizeH10,
          ],
        ),
      ),
    );
  }
}

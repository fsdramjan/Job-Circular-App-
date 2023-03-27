import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/pages/auth/forgetPassword/forgetPasswordPage.dart';
import 'package:job_circular_app/view/pages/auth/registerPage.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class LoginPage extends StatelessWidget with AllController {
  final isShowPassword = RxBool(true);
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
            sizeH10,
            KText(
              text: 'Password',
            ),
            sizeH10,
            Obx(
              () => cFormField(
                height: 45,
                controller: authC.password.value,
                borderColor: grey,
                hintText: isShowPassword.value ? '********' : '12345678',
                fontSize: 16,
                obscureText: isShowPassword.value,
                contentPadding: paddingH10,
                suffixIcon: iconButton(
                  onTap: () {
                    isShowPassword.value = !isShowPassword.value;
                    print(isShowPassword.value);
                  },
                  icons: isShowPassword.value
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  iconColor: grey,
                  isHideCirleAvatar: true,
                  iconSize: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.to(ForgetPasswordPage()),
                child: KText(
                  text: 'Forget password?',
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
            ),
            sizeH10,
            customCard(
              color: green,
              height: 40,
              borderRadiusC: 10,
              onTap: () => authC.login(),
              child: Center(
                child: KText(
                  text: 'Login',
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
                KText(text: '''Don't have account?'''),
                // sizeW20,
                TextButton(
                  onPressed: () => Get.to(RegisterPage()),
                  child: KText(
                    text: 'Register',
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

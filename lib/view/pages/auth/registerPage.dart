import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/pages/auth/loginPage.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class RegisterPage extends StatelessWidget with AllController {
  final isShowPassword = RxBool(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: sidebarComponent(),
      // appBar: cAppBar(title: 'Register'),
      body: Padding(
        padding: paddingAll10,
        child: ListView(
          children: [
            sizeH10,

            Obx(
              () => GestureDetector(
                onTap: () {
                  fileUploadC.pickImage(uploadCategory: 'users');
                },
                child: CircleAvatar(
                  radius: 40,
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: white,
                    backgroundImage: fileUploadC.selectedImage.value != ''
                        ? NetworkImage(fileUploadC.selectedImage.value)
                        : null,
                    child: Icon(
                      Icons.add_a_photo,
                    ),
                  ),
                ),
              ),
            ),
            sizeH5,
            Center(
              child: KText(
                text: 'Add Profile Picture',
                fontSize: 12,
                color: black54,
              ),
            ),
            sizeH10,
            KText(
              text: 'Name',
            ),
            sizeH10,

            cFormField(
              height: 45,
              controller: authC.name.value,
              borderColor: grey,
              hintText: 'Enter your name',
              fontSize: 16,
              contentPadding: paddingH10,
            ),
            sizeH10,
            KText(
              text: 'Email',
            ),
            sizeH10,

            cFormField(
              height: 45,
              borderColor: grey,
              controller: authC.email.value,
              hintText: 'Enter your email',
              fontSize: 16,
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
                borderColor: grey,
                controller: authC.password.value,
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
            sizeH20,
            customCard(
              color: green,
              height: 40,
              borderRadiusC: 10,
              onTap: () {
                if (authC.email.value.text.isEmpty ||
                    authC.name.value.text.isEmpty ||
                    authC.password.value.text.isEmpty) {
                  snackbar('Field Empty!!', bgColor: red);
                } else {
                  if (fileUploadC.selectedImage.value == '') {
                    snackbar('Profile Image Empty!!', bgColor: red);
                  } else {
                    if (authC.email.value.text.isEmail) {
                      authC.createNewUser();
                    } else {
                      snackbar('Invalid email!!', bgColor: red);
                    }
                  }
                }
              },
              child: Center(
                child: KText(
                  text: 'Register',
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
                KText(text: '''Already have an account?'''),
                // sizeW20,
                TextButton(
                  onPressed: () => Get.to(LoginPage()),
                  child: KText(
                    text: 'Login',
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
              ],
            ),
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

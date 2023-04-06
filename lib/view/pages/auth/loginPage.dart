import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/service/snackbar/snackbar.dart';
import 'package:job_circular_app/view/pages/auth/forgetPassword/forgetPasswordPage.dart';
import 'package:job_circular_app/view/pages/auth/otp/otpVerificationPage.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/form/cFormField.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

class LoginPage extends StatelessWidget with AllController {
  final isShowPassword = RxBool(true);
  @override
  Widget build(BuildContext context) {
    authC.phoneController.text = '';
    return Scaffold(
      // drawer: sidebarComponent(),
      // appBar: cAppBar(title: 'Login'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: paddingAll10,
            child: customCard(
              borderRadiusC: 10,
              color: white,
              borderColor: blue.shade100,
              child: Padding(
                padding: paddingAll10,
                child: Column(
                  children: [
                    sizeH10,

                    Padding(
                      padding: EdgeInsets.only(top: Get.height / 10),
                      child: FlutterLogo(
                        size: 100,
                      ),
                    ),
                    sizeH10,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: KText(
                        text: 'Phone Number',
                      ),
                    ),
                    sizeH10,
                    cFormField(
                      height: 45,
                      borderColor: grey,
                      hintText: 'Enter your phone',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: KText(
                              text: '+880',
                              color: white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      fontSize: 16,
                      controller: authC.phoneController,
                      contentPadding: paddingH10,
                    ),
                    // sizeH10,
                    // KText(
                    //   text: 'Password',
                    // ),
                    // sizeH10,
                    // Obx(
                    //   () => cFormField(
                    //     height: 45,
                    //     controller: authC.password.value,
                    //     borderColor: grey,
                    //     hintText: isShowPassword.value ? '********' : '12345678',
                    //     fontSize: 16,
                    //     obscureText: isShowPassword.value,
                    //     contentPadding: paddingH10,
                    //     suffixIcon: iconButton(
                    //       onTap: () {
                    //         isShowPassword.value = !isShowPassword.value;
                    //         print(isShowPassword.value);
                    //       },
                    //       icons: isShowPassword.value
                    //           ? Icons.visibility_off
                    //           : Icons.remove_red_eye,
                    //       iconColor: grey,
                    //       isHideCirleAvatar: true,
                    //       iconSize: 15,
                    //     ),
                    //   ),
                    // ),

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
                      onTap: () {
                        if (authC.phoneController.text.length == 10) {
                          authC.codeController.clear();
                          Get.to(OtpVerificationPage());
                        } else {
                          snackbar(
                              'Mobile Number must be of 10 digit. Without 0 digit.',
                              bgColor: red);
                        }
                      },
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     KText(text: '''Don't have account?'''),
                    //     // sizeW20,
                    //     TextButton(
                    //       onPressed: () => Get.to(RegisterPage()),
                    //       child: KText(
                    //         text: 'Register',
                    //         fontWeight: FontWeight.bold,
                    //         color: green,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

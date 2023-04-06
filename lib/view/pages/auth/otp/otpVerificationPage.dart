import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/service/controllerService.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpVerificationPage extends StatefulWidget {
  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage>
    with AllController {
  final FocusNode _pinPutFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: blue),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  void initState() {
    authC.sendOTP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authC.phoneController.text.replaceFirst('0', '');
    final String phone = "+880" + authC.phoneController.text.trim();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: customCard(
              borderRadiusC: 10,
              color: white,
              borderColor: blue.shade100,
              child: Padding(
                padding: paddingH10V20,
                child: Column(
                  children: [
                    FlutterLogo(
                      size: 100,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "OTP Verification",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "An verification code has been sent to $phone",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PinPut(
                      fieldsCount: 6,
                      focusNode: _pinPutFocusNode,
                      controller: authC.codeController,
                      validator: (code) {
                        if (code!.length != 6)
                          return 'OTP must be of 6 digit';
                        else
                          return null;
                      },
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(12)),
                      selectedFieldDecoration: _pinPutDecoration,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "I didn't receive code? ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        Obx(
                          () => authC.endTime.value == 0
                              ? SizedBox()
                              : CountdownTimer(
                                  endTime: authC.endTime.value,
                                  widgetBuilder:
                                      (_, CurrentRemainingTime? time) {
                                    if (time == null) {
                                      return customCard(
                                        onTap: () {
                                          authC.sendOTP();
                                        },
                                        borderRadiusC: 5,
                                        color: red,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: KText(
                                            text: 'Resend Code',
                                            color: white,
                                          ),
                                        ),
                                      );
                                    }
                                    return Text(
                                      '${time.min == null ? 0 : time.min}:${time.sec == null ? 0 : time.sec}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: red),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    customCard(
                      width: Get.width,
                      color: green,
                      height: 40,
                      borderRadiusC: 5,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authC.submitVerificationCode();
                        }
                      },
                      child: Center(
                        child: KText(
                          text: 'NEXT',
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

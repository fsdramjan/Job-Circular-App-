import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import '../../view/widgets/text/kText.dart';

loadingDialog({String? loadingText, bool barrierDismissible = false}) {
  var context = Get.context as BuildContext;
  showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(blue),
                ),
                SizedBox(
                  height: 15,
                ),
                KText(
                  text: loadingText ?? 'Processing...',
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        );
      });
}

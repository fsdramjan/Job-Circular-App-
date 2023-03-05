import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/text/kText.dart';
import '../configs/appColors.dart';

snackbar(
  String? message, {
  Color? textColor,
  Color? bgColor,
  Widget? child,
}) {
  ScaffoldMessenger.of(Get.context as BuildContext).showSnackBar(
    SnackBar(
      backgroundColor: bgColor ?? green,
      showCloseIcon: true,
      closeIconColor: white,
      elevation: 50,
      content: child ??
          KText(
            text: message.toString(),
            color: textColor ?? white,
          ),
    ),
  );
}

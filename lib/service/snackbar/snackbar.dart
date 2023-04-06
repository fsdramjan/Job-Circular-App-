import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/text/kText.dart';
import '../configs/appColors.dart';

snackbar(
  String? message, {
  Color? textColor,
  Color? bgColor,
  Widget? child,
  bool? showCloseIcon = true,
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(Get.context as BuildContext).showSnackBar(
    SnackBar(
      backgroundColor: bgColor ?? green,
      showCloseIcon: showCloseIcon,
      closeIconColor: white,
      elevation: 50,
      action: action,
      // duration: Duration(minutes: 30),
      content: child ??
          KText(
            text: message.toString(),
            color: textColor ?? white,
          ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/widgets/button/iconButton.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';

import '../../../service/configs/appColors.dart';
import '../text/kText.dart';

Widget ads() {
  return Container(
    height: 60,
    width: Get.width,
    color: white,
    child: Padding(
      padding: paddingAll10,
      child: Row(
        children: [
          customCard(
            color: blue,
            width: 60,
            borderRadiusC: 5,
            child: FlutterLogo(
              size: 150,
            ),
          ),
          // Spacer(),
          sizeW20,
          KText(
            text: 'Lorem Ipsum Dolor Sumit. Test Ads.',
          ),
          // sizeW20,
          Spacer(),
          iconButton(
            icons: Icons.ads_click,
          ),
        ],
      ),
    ),
  );
}

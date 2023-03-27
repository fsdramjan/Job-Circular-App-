import 'package:flutter/material.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';
import '../card/customCard.dart';
import '../text/kText.dart';

Widget loadmoreButton({
  required void Function()? onTap,
  double? width,
}) {
  return InkWell(
    onTap: onTap,
    child: customCard(
      width: width,
      borderRadius: BorderRadius.circular(30),
      color: blue,
      borderColor: red,
      child: Padding(
        padding: paddingH10V5,
        child: Center(
          child: KText(
            text: 'Load More',
            fontSize: 16,
            color: white,
          ),
        ),
      ),
    ),
  );
}

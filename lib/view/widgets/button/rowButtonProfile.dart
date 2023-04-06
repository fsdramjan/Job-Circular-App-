import 'package:flutter/material.dart';
import 'package:job_circular_app/service/configs/appColors.dart';
import 'package:job_circular_app/service/configs/appUtils.dart';
import 'package:job_circular_app/view/widgets/card/customCard.dart';
import 'package:job_circular_app/view/widgets/text/kText.dart';

Widget rowButtonProfile({
  void Function()? onTap,
  required String? leadingText,
  Color? leadingTextColor,
  IconData? rightIcon,
  Color? rightIconColor,
  Widget? child,
  EdgeInsetsGeometry? padding,
  bool? isCenterText = false,
}) {
  return customCard(
    onTap: onTap,
    borderRadiusC: 5,
    color: grey.shade50,
    elevation: .2,
    height: 35,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: grey.shade300,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: padding ?? paddingH10V5,
        child:isCenterText==true?   Center(
          child: KText(
                text: leadingText.toString(),
                color: black54,
              ),
        ) : Row(
          children: [
            KText(
              text: leadingText.toString(),
              color:leadingTextColor?? black54,
            ),
            Spacer(),
            child ?? SizedBox(),
            sizeW10,
            rightIcon == null
                ? SizedBox()
                : Icon(
                    rightIcon,
                    size: 20,
                    color:rightIconColor?? grey,
                  ),
          ],
        ),
      ),
    ),
  );
}

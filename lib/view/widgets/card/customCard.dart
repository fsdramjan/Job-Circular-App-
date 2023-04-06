import 'package:flutter/material.dart';

import '../../../service/configs/appColors.dart';

Widget customCard({
  required Widget child,
  Color? color,
  void Function()? onTap,
  EdgeInsetsGeometry? padding,
  double? height,
  double? width,
  double? elevation,
  double? borderRadiusC,
  BorderRadiusGeometry? borderRadius,
  Color? borderColor,
}) {
  return Card(
    elevation: elevation,
    margin: padding ?? EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusC ?? 0),
    ),
    color: color ?? grey.shade200,
    child: InkWell(
      onTap: onTap ?? null,
      borderRadius: BorderRadius.circular(borderRadiusC ?? 0),
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius:
        //       borderRadius ?? BorderRadius.circular(borderRadiusC ?? 0),
        //   color: color ?? grey.shade200,
        //   border: Border.all(
        //     color: borderColor ?? white,
        //   ),
        // ),
        height: height,
        width: width,
        child: child,
      ),
    ),
  );
}

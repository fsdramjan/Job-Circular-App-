import 'package:flutter/material.dart';
import '../../../service/configs/appColors.dart';

Widget iconButton({
  void Function()? onTap,
 required IconData? icons,
  Widget? child,
  double? iconSize,
  Color? iconColor,
  FontWeight? fontWeight,
  Color? onPrimaryColor,
  final double? elevation,
  final double? height,
  final double? width,
  final Color? buttonBackgroundColor,
  final double? borderRadius,
  final borderSideColor,
  tooltip = '',
  double? splashRadius,
  bool? isHideCirleAvatar = false,
  bool? hideOutsideColor = false,
}) {
  return Container(
    height: isHideCirleAvatar == true ? height : height ?? 35,
    width: width,
    decoration: isHideCirleAvatar == true
        ? null
        : BoxDecoration(
            shape: BoxShape.circle,
            color: hideOutsideColor == true
                ? null
                : iconColor == null
                    ? null
                    : iconColor.withOpacity(.2),
            // borderRadius:
            //     BorderRadius.circular(30),
          ),
    child: IconButton(
      tooltip: tooltip,
      onPressed: onTap ?? () {},
      splashRadius: splashRadius ?? 20,
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            color: borderSideColor ?? transparent,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(onPrimaryColor),
        backgroundColor:
            MaterialStateProperty.all(buttonBackgroundColor ?? black),
        elevation: MaterialStateProperty.all(elevation),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        alignment: Alignment.center,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
          ),
        ),
      ),
      icon: child ??
          Icon(
            icons,
            size: iconSize,
            color: iconColor,
          ),
    ),
  );
}

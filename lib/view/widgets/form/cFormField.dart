import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';

Widget cFormField({
  double? height,
  Color? borderColor,
  String? hintText,
  TextAlign textAlign = TextAlign.start,
  TextEditingController? controller,
  bool readOnly = false,
  bool isRequiredField = false,
  String? validatorText,
  TextInputType? textInputType,
  Widget? prefixIcon,
  Widget? suffixIcon,
  void Function(String)? onChanged,
  TextStyle? style,
  double? borderRadius,
  double? fontSize,
  EdgeInsetsGeometry? contentPadding,
  bool obscureText = false,
  int? minLines,
  int? maxLines = 1,
  bool? isAutoValidateText = false,
}) {
  return SizedBox(
    height: height == 0 ? null : height ?? 25,
    child: TextFormField(
      onChanged: onChanged,
      controller: controller ?? TextEditingController(),
      keyboardType: textInputType,
      textAlign: textAlign,
      readOnly: readOnly,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText,
      obscuringCharacter: '*',
      style: style ??
          GoogleFonts.hindSiliguri(
            fontSize: fontSize ?? 12,
            fontWeight: FontWeight.w600,
          ),
      validator: isRequiredField == false
          ? null
          : isAutoValidateText == true
              ? (val) {
                  if (val!.isEmpty) {
                    return 'Enter your $hintText';
                  }
                  return null;
                }
              : validatorText == '' &&
                      validatorText!.isEmpty &&
                      validatorText == 'null'
                  ? null
                  : (val) {
                      if (val!.isEmpty) {
                        return validatorText;
                      }
                      return null;
                    },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(
            color: borderColor ?? grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(
            color: blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(
            color: red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(
            color: red,
          ),
        ),
        contentPadding: contentPadding ?? paddingH5,
        hintText: '$hintText',
        hintStyle: GoogleFonts.hindSiliguri(
          fontSize: fontSize != null ? fontSize - 2 : 12,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: white,
        filled: true,
      ),
    ),
  );
}

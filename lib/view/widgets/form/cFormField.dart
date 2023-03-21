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
}) {
  return SizedBox(
    height: height ?? 25,
    child: TextFormField(
      onChanged: onChanged,
      controller: controller ?? TextEditingController(),
      keyboardType: textInputType,
      textAlign: textAlign,
      readOnly: readOnly,
      style:style?? GoogleFonts.hindSiliguri(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      validator: isRequiredField == false
          ? null
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
          borderSide: BorderSide(
            color: grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: red,
          ),
        ),
        contentPadding: paddingH5,
        hintText: '$hintText',
        hintStyle: GoogleFonts.hindSiliguri(
          fontSize: 12,
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

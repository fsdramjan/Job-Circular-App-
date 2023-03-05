import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../service/configs/appColors.dart';
import '../../../service/configs/appUtils.dart';

cFormField({
  double? height,
  Color? borderColor,
  String? hintText,
  TextAlign textAlign = TextAlign.start,
  TextEditingController? controller,
  bool readOnly = false,
  bool isRequiredField = false,
  String? validatorText,
  TextInputType? textInputType,
}) {
  return SizedBox(
    height: 25,
    child: TextFormField(
      controller: controller ?? TextEditingController(),
      keyboardType: textInputType,
      textAlign: textAlign,
      readOnly: readOnly,
      style: GoogleFonts.hindSiliguri(
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
        fillColor: white,
        filled: true,
      ),
    ),
  );
}

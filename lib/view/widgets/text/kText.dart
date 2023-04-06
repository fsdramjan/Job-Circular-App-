// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../service/configs/appColors.dart';

class KText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? wordSpacing;
  final double? letterSpacing;

  final TextDirection? textDirection;
  final TextDecoration? decoration;
  TextOverflow? overflow;

  Paint? foreground;
  FontStyle? fontStyle;
  KText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.textDirection,
    this.wordSpacing,
    this.letterSpacing,
    this.decoration,
    this.overflow,
    this.foreground,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      // style: TextStyle(
        style: GoogleFonts.hindSiliguri(
        decoration: decoration,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? black,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        foreground: foreground,
        fontStyle: fontStyle,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}

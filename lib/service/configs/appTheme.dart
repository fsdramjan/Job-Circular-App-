// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: black,
    scaffoldBackgroundColor: white,
    iconTheme: IconThemeData(
      color: black,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStatePropertyAll(green),
      radius: Radius.circular(10),
      isAlwaysShown: true,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: green,
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
  );
}

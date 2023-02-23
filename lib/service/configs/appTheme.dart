import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: black,
    scaffoldBackgroundColor: white,
    iconTheme: IconThemeData(
      color: black,
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

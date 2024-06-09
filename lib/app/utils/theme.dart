import 'package:flutter/material.dart';
import 'package:jala_media/app/utils/colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    fontFamily: 'Lato',
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 18,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
  );
}

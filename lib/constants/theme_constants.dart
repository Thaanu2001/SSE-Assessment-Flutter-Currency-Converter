// app theme constants
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFffffff);

  static const Color grey = Color(0xFF4E4E4E);
  static const Color greyTint1 = Color(0xFF6D6D6D);
  static const Color greyTint2 = Color(0xFFb0aeae);
  static const Color greyTint3 = Color(0xffd9d9d9);
  static const Color greyTint4 = Color(0xffE9E9E5);
  static const Color greyTint5 = Color(0xfff5f6f5);
  static const Color greyShade1 = Color(0xFF272727);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFEF233C);
  static const Color green = Color(0xFF32a852);
  static const Color yellow = Color(0xFFf7b500);
  static const Color blue = Color(0xFF0099FA);

  static const Color textColor = Color(0xFF2B2B2B);
  static const Color backgroundColor = Color(0xff181818);

  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 30;

  static BoxShadow defaultShadow = BoxShadow(
    color: black.withOpacity(0.06),
    blurRadius: 14,
    offset: const Offset(4, 4),
  );

  static double get bottomPadding {
    return MediaQuery.paddingOf(Get.context!).bottom == 0
        ? 20
        : MediaQuery.paddingOf(Get.context!).bottom + 10;
  }

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(color: primaryColor, centerTitle: true),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: 'Outfit',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        color: textColor,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: textColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.only(left: 14, top: 12, bottom: 12, right: 14),
      labelStyle: const TextStyle(
        color: Color(0xEE6D6D6D),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: const TextStyle(
        color: greyTint2,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: const TextStyle(
        color: primaryColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          width: 1.5,
          color: greyTint3,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          width: 1.5,
          color: greyTint3,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          width: 1.5,
          color: greyTint2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          width: 1.5,
          color: red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          width: 1.5,
          color: red,
        ),
      ),
      fillColor: backgroundColor,
      border: InputBorder.none,
      filled: true,
      isDense: true,
      errorMaxLines: 2,
      errorStyle: const TextStyle(color: red),
    ),
  );
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lichi_test/core/constants/style/text_styles.dart';

import 'colors.dart';
import 'layout_constants.dart';

class LightTheme {

  static const Color primary = CustomColors.dark;
  static const Color secondary = CustomColors.lightBeige;
  static const Color canvas = CustomColors.white;
  static const Color hint = CustomColors.grey;
  static const Color red = CustomColors.red;

  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    primaryColorDark: secondary,
    primaryColorLight: canvas,
    hintColor: hint,
    splashColor: red,
    textTheme: const TextTheme(
        bodySmall: CustomTextStyles.whiteSmallTextColor,
        bodyMedium: CustomTextStyles.whiteTextColor,
        bodyLarge: CustomTextStyles.whiteBoldTextColor,
        titleMedium: CustomTextStyles.greyTextColor,
        titleSmall: CustomTextStyles.greySmallTextColor,
        titleLarge: CustomTextStyles.greyBoldTextColor,
        displayMedium: CustomTextStyles.darkTextColor,
        displaySmall: CustomTextStyles.darkSmallTextColor,
        displayLarge: CustomTextStyles.darkBoldTextColor,
        headlineMedium: CustomTextStyles.redTextColor
    ),
    iconTheme: const IconThemeData(
        color: primary, size: LayoutConstants.iconSize),
    appBarTheme: const AppBarTheme(
        color: primary
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primary)
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
    ),
    scaffoldBackgroundColor: canvas,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primary,
        secondary: secondary,
        background: canvas,
        onBackground: canvas
    ),
  );
}

class DarkTheme {

  static const Color primary = CustomColors.lightBeige;
  static const Color secondary = CustomColors.white;
  static const Color canvas = CustomColors.dark;
  static const Color hint = CustomColors.grey;
  static const Color red = CustomColors.red;

  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    primaryColorDark: secondary,
    primaryColorLight: canvas,
    hintColor: hint,
    splashColor: red,
    textTheme: const TextTheme(
        bodySmall: CustomTextStyles.whiteSmallTextColor,
        bodyMedium: CustomTextStyles.whiteTextColor,
        bodyLarge: CustomTextStyles.whiteBoldTextColor,
        titleMedium: CustomTextStyles.greyTextColor,
        titleSmall: CustomTextStyles.greySmallTextColor,
        titleLarge: CustomTextStyles.greyBoldTextColor,
        displayMedium: CustomTextStyles.darkTextColor,
        displaySmall: CustomTextStyles.darkSmallTextColor,
        displayLarge: CustomTextStyles.darkBoldTextColor,
        headlineMedium: CustomTextStyles.redTextColor
    ),
    iconTheme: const IconThemeData(
        color: primary, size: LayoutConstants.iconSize),
    appBarTheme: const AppBarTheme(
        color: primary
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primary,
        secondary: secondary,
        background: canvas,
        onBackground: canvas
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primary)
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
    ),
  );
}
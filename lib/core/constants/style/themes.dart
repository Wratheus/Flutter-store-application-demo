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

  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    primaryColorDark: secondary,
    primaryColorLight: canvas,
    hintColor: hint,
    textTheme: const TextTheme(
      bodySmall: CustomTextStyles.darkSmallTextColor,
      bodyMedium: CustomTextStyles.darkTextColor,
      bodyLarge: CustomTextStyles.darkBoldTextColor,
      titleLarge: CustomTextStyles.whiteTextColor,
      displayMedium: CustomTextStyles.greyTextColor,
      headlineMedium: CustomTextStyles.redTextColor
    ),
    iconTheme: const IconThemeData(
        color: primary, size: LayoutConstants.iconSize),
    appBarTheme: const AppBarTheme(
        color: primary
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

  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    primaryColorDark: secondary,
    primaryColorLight: canvas,
    hintColor: hint,
    textTheme: const TextTheme(
        bodySmall: CustomTextStyles.whiteSmallTextColor,
        bodyMedium: CustomTextStyles.whiteTextColor,
        bodyLarge: CustomTextStyles.whiteBoldTextColor,
        titleLarge: CustomTextStyles.darkTextColor,
        displayMedium: CustomTextStyles.greyTextColor,
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
  );
}
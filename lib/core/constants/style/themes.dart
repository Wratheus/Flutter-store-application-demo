import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lichi_test/core/constants/style/text_styles.dart';

import 'colors.dart';

abstract class AppTheme {}

class LightTheme extends AppTheme {
  static const Color primary = CustomColors.dark;
  static const Color secondary = CustomColors.white;
  static const Color canvas = CustomColors.grey;
  static const Color hint = CustomColors.grey;
  static const Color red = CustomColors.red;

  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    primaryColorDark: secondary,
    hintColor: hint,
    canvasColor: canvas,
    splashColor: red,
    textTheme: const TextTheme(
        bodySmall: CustomTextStyles.darkSmallTextColor,
        bodyMedium: CustomTextStyles.darkTextColor,
        bodyLarge: CustomTextStyles.darkBoldTextColor,
        titleMedium: CustomTextStyles.greyTextColor,
        titleSmall: CustomTextStyles.greySmallTextColor,
        titleLarge: CustomTextStyles.greyBoldTextColor,
        displayMedium: CustomTextStyles.darkTextColor,
        displaySmall: CustomTextStyles.darkSmallTextColor,
        displayLarge: CustomTextStyles.darkBoldTextColor,
        headlineMedium: CustomTextStyles.redTextColor),
    iconTheme:
        const IconThemeData(color: primary, size: 15),
    scaffoldBackgroundColor: secondary,
    appBarTheme: const AppBarTheme(
      color: secondary,
      elevation: 0,
      iconTheme: IconThemeData(color: primary, size: 15),
      centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: primary)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primary,
        secondary: secondary,
        background: secondary,
        onBackground: canvas),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: secondary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primary,
      unselectedItemColor: primary.withOpacity(0.5),
    ),
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LightTheme && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class DarkTheme extends AppTheme {
  static const Color primary = CustomColors.white;
  static const Color secondary = CustomColors.darkBackGround;
  static const Color canvas = CustomColors.dark;
  static const Color hint = CustomColors.grey;
  static const Color red = CustomColors.red;

  static ThemeData themeData = ThemeData(
    primaryColor: primary,
    primaryColorDark: canvas,
    canvasColor: secondary,
    hintColor: hint,
    splashColor: red,
    textTheme: const TextTheme(
      bodySmall: CustomTextStyles.whiteSmallTextColor,
      bodyMedium: CustomTextStyles.whiteTextColor,
      bodyLarge: CustomTextStyles.whiteBoldTextColor,
      titleMedium: CustomTextStyles.whiteTextColor,
      titleSmall: CustomTextStyles.whiteSmallTextColor,
      titleLarge: CustomTextStyles.whiteBoldTextColor,
      displayMedium: CustomTextStyles.whiteTextColor,
      displaySmall: CustomTextStyles.whiteSmallTextColor,
      displayLarge: CustomTextStyles.whiteBoldTextColor,
      headlineMedium: CustomTextStyles.redTextColor,
      labelSmall: CustomTextStyles.whiteSmallTextColor,
      labelMedium: CustomTextStyles.whiteTextColor,
      labelLarge: CustomTextStyles.whiteBoldTextColor,
    ),
    iconTheme:
        const IconThemeData(color: primary, size: 15),
    appBarTheme: const AppBarTheme(
      color: canvas,
      elevation: 0,
      iconTheme: IconThemeData(color: primary, size: 15),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: canvas,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: primary,
        secondary: secondary,
        background: canvas,
        onBackground: canvas),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: primary)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: canvas,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primary,
      unselectedItemColor: primary.withOpacity(0.5),
    ),
  );
}

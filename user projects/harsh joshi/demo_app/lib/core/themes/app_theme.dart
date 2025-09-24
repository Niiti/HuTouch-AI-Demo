// lib/core/themes/app_theme.dart
import 'package:flutter/material.dart';
import '../constants/color_palette.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorPalette.brown,
    scaffoldBackgroundColor: ColorPalette.darkGrey,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ColorPalette.white),
      bodyMedium: TextStyle(color: ColorPalette.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.darkGrey,
      selectedItemColor: ColorPalette.brown,
      unselectedItemColor: ColorPalette.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
    ),
  );

  static ThemeData get themeData => lightTheme;
}

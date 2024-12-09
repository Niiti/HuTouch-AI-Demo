// lib/core/themes/app_theme.dart
import 'package:flutter/material.dart';
import '../constants/color_palette.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorPalette.brown,
    scaffoldBackgroundColor: ColorPalette.darkGrey,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorPalette.white),
      bodyMedium: TextStyle(color: ColorPalette.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.darkGrey,
      selectedItemColor: ColorPalette.brown,
      unselectedItemColor: ColorPalette.grey,
    ),
  );

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: ColorPalette.darkGrey,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorPalette.darkGrey,
        selectedItemColor: ColorPalette.brown,
        unselectedItemColor: ColorPalette.grey,
      ),
      primaryColor: ColorPalette.primaryColor,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: ColorPalette.white),
        bodyMedium: TextStyle(color: ColorPalette.white70),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPalette
              .primaryColor, // Use backgroundColor instead of primary
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
        ),
      ),
    );
  }
}

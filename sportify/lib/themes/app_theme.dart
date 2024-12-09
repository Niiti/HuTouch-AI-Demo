import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.red, // Original primarySwatch
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor, // Set background color here
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
      background: AppColors.backgroundColor, // Background color in colorScheme
    ),
    fontFamily: 'Azeret Mono', // Updated fontFamily
    visualDensity: VisualDensity.adaptivePlatformDensity, // Retained visualDensity
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textColor,
      ), // Use bodyLarge instead of bodyText1
      bodyMedium: TextStyle(
        color: AppColors.textColor,
      ), // Use bodyMedium instead of bodyText2
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentColor, // Use backgroundColor for button
        textStyle: TextStyle(
          fontFamily: 'Bebas Neue',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}


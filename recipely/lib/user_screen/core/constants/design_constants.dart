import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Colors.teal;
  static const iconColor = Colors.black;
  static const textColor = Colors.black87;
}

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: AppColors.iconColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textColor),
      bodyMedium: TextStyle(color: AppColors.textColor),
    ),
  );
}

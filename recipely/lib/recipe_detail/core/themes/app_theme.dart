import 'package:flutter/material.dart';
import 'package:recipely/recipe_detail/data/app_constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppConstants.primaryColor,
    scaffoldBackgroundColor: Color(0xFFF8F8F8),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontFamily: 'Sofia Pro'),
      bodyMedium: TextStyle(fontFamily: 'Sofia Pro'),
    ),
    // Additional theme configurations can be added here
  );
}

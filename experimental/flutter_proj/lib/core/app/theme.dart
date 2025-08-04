import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(seedColor: ColorPalette.primary);
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: colorScheme.surface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
    );
  }
}

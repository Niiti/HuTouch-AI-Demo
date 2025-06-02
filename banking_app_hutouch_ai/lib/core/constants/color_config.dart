import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF0066FF);
const Color kOnPrimaryColor = Colors.white;
const Color kBackgroundColor = Colors.white;
const Color kSurfaceColor = Color(0xFFF4F4F4);
const Color kOnSurfaceColor = Color(0xFF1E1E2D);
const Color kOutlineColor = Color(0xFF707070);

final ColorScheme appColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: kPrimaryColor,
  onPrimary: kOnPrimaryColor,
  background: kBackgroundColor,
  onBackground: kOnSurfaceColor,
  surface: kSurfaceColor,
  onSurface: kOnSurfaceColor,
  error: Colors.red,
  onError: Colors.white,
  primaryContainer: kPrimaryColor.withOpacity(0.1),
  onPrimaryContainer: kPrimaryColor,
  secondary: kOnSurfaceColor,
  onSecondary: kOnSurfaceColor,
  secondaryContainer: kSurfaceColor,
  onSecondaryContainer: kOnSurfaceColor,
  tertiary: Colors.green,
  onTertiary: Colors.white,
);
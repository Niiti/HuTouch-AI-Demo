// lib/utils/responsive_helper.dart
import 'package:flutter/material.dart';
import '../constants/app_values.dart';

class ResponsiveHelper {
  static double getFontSizeScale(double width) {
    return width / AppValues.baseWidth;
  }

  // Add more responsive helpers if needed
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getResponsivePadding(BuildContext context, double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  static double getResponsiveFontSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }

  static double getResponsiveWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * value;
  }

  static double getResponsiveHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }
}

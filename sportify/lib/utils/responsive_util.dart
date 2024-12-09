import 'package:flutter/widgets.dart';
import './responsive_helper.dart';

class ResponsiveUtil {
  static EdgeInsets getResponsivePadding(
      BuildContext context, double horizontal, double vertical) {
    return EdgeInsets.symmetric(
      horizontal: ResponsiveHelper.getResponsiveWidth(context, horizontal),
      vertical: ResponsiveHelper.getResponsiveHeight(context, vertical),
    );
  }

  static double getResponsiveFontSize(BuildContext context, double size) {
    return ResponsiveHelper.getResponsiveWidth(context, size);
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double setFontSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }

  static EdgeInsets setPadding(BuildContext context, double padding) {
    return EdgeInsets.all(padding);
  }
}

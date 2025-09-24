// lib/core/constants/theme_constants.dart
import 'package:flutter/material.dart';
import 'color_palette.dart';
import 'app_constants.dart';

class ThemeConstants {
  static const String fontFamily = 'Sora';

  static TextStyle headingStyle(double fontSize, {Color color = ColorPalette.white}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: 1.2,
      fontFamily: '$fontFamily-Regular',
    );
  }

  static TextStyle subHeadingStyle(double fontSize, {Color color = ColorPalette.white70}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: '$fontFamily-Regular',
    );
  }

  static ButtonStyle elevatedButtonStyle(double height, double width) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(ColorPalette.primaryColor),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.2),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
    );
  }

  static TextStyle locationText = const TextStyle(
    color: ColorPalette.grey,
    fontSize: 15,
    fontFamily: fontFamily,
  );

  static TextStyle locationDetailText = const TextStyle(
    color: ColorPalette.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle promoLabelText = const TextStyle(
    color: ColorPalette.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle promoTitleText = const TextStyle(
    color: ColorPalette.white,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static TextStyle categoryText = const TextStyle(
    fontSize: 16,
    fontFamily: fontFamily,
  );

  static TextStyle productTitleText = const TextStyle(
    color: Color(0xFF242424),
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle productSubtitleText = const TextStyle(
    color: ColorPalette.grey,
    fontSize: 12,
    fontFamily: fontFamily,
  );

  static TextStyle productPriceText = const TextStyle(
    color: Color(0xFF050505),
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );
}

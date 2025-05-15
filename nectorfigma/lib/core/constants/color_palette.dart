import 'package:flutter/material.dart';

class ColorPalette {
  ColorPalette._();
  static const Color primary = Color(0xFF53B175);
  static const Color secondary = Color(0xFFF8A44C);
  static const Color background = Colors.white;
  static const Color textPrimary = Color(0xFF181727);
  static const Color textSecondary = Color(0xFF7C7C7C);
  static const Color border = Color(0xFFE2E2E2);
  // static const Color primary = Color(0xFF53B175);
  static const Color onPrimary = Colors.white;
  // static const Color background = Colors.white;
  static const Color onBackground = Color(0xFF181725);
  static const Color inactive = Colors.black;
  // static const Color textSecondary = Color(0xFF7C7C7C);
  static const Color divider = Color(0xFFE2E2E2);
  static final ColorScheme primaryScheme = ColorScheme.fromSeed(
    seedColor: primary,
    background: background,
    onBackground: onBackground,
    primary: primary,
    onPrimary: onPrimary,
  );
  // static const Color primary = Color(0xFF53B175);
  //   static const Color onPrimary = Colors.white;
  static const Color freshBg = Color.fromRGBO(83, 177, 117, 0.1);
  static const Color freshBorder = Color.fromRGBO(83, 177, 117, 0.7);
  static const Color oilBg = Color.fromRGBO(248, 164, 76, 0.1);
  static const Color oilBorder = Color.fromRGBO(248, 164, 76, 0.7);
  static const Color meatBg = Color.fromRGBO(247, 165, 147, 0.25);
  static const Color meatBorder = Color.fromRGBO(247, 165, 147, 1);
  static const Color bakeryBg = Color.fromRGBO(211, 176, 224, 0.25);
  static const Color bakeryBorder = Color.fromRGBO(211, 176, 224, 1);
  static const Color dairyBg = Color.fromRGBO(253, 229, 152, 0.25);
  static const Color dairyBorder = Color.fromRGBO(253, 229, 152, 1);
  static const Color beveragesBg = Color.fromRGBO(183, 223, 245, 0.25);
  static const Color beveragesBorder = Color.fromRGBO(183, 223, 245, 1);
  // static const Color textPrimary = Color(0xFF181725);
  // static const Color textSecondary = Color(0xFF7C7C7C);
  static const white = Colors.white;
}

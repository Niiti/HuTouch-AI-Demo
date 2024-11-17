import 'dart:ui';

class FeatureModel {
  final String iconPath;
  final String mainText;
  final String subText;
  final Color outlineColor;
  final Color fillColor;
  final Color shadowColor;

  FeatureModel({
    required this.iconPath,
    required this.mainText,
    required this.subText,
    required this.outlineColor,
    required this.fillColor,
    required this.shadowColor,
  });
}
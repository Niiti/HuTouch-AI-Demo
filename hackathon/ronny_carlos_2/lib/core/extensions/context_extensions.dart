import 'package:flutter/material.dart';

extension ContextExtensionss on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get widthUnit => screenWidth / 100;
  double get heightUnit => screenHeight / 100;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape => !isPortrait;
  double get viewInsetsBottom => MediaQuery.of(this).viewInsets.bottom;
}

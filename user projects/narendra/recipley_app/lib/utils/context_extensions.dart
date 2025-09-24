import 'package:flutter/widgets.dart';

extension ContextX on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get widthUnit => screenWidth / 100;
  double get heightUnit => screenHeight / 100;
}

class ContextExtensionss {
  final BuildContext context;
  ContextExtensionss(this.context);
  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;
  bool get isLandscape => !isPortrait;
}

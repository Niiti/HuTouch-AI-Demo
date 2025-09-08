import 'package:flutter/widgets.dart';

extension BuildContextX on BuildContext {
  Size get _size => MediaQuery.sizeOf(this);
  double get screenWidth => _size.width;
  double get screenHeight => _size.height;

  double get widthUnit => screenWidth / 100.0;
  double get heightUnit => screenHeight / 100.0;

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
}

class ContextExtensionss {
  final BuildContext context;
  const ContextExtensionss(this.context);

  bool get isPortrait => MediaQuery.orientationOf(context) == Orientation.portrait;
  bool get isLandscape => !isPortrait;
}

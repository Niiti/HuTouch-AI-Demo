import 'package:flutter/material.dart';

class ResponsiveHelper {
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static int getCrossAxisCount(Size size) {
    if (size.width > 1200) {
      return 4;
    } else if (size.width > 800) {
      return 3;
    } else {
      return 2;
    }
  }
}

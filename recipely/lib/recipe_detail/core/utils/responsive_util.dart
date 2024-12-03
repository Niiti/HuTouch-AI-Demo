import 'package:flutter/material.dart';

class ResponsiveUtil {
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
}

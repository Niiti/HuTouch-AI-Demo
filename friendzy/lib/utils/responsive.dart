// Utility class for responsive design (if needed in future enhancements)
import 'package:flutter/widgets.dart';

class Responsive {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isSmallScreen(BuildContext context) => screenWidth(context) < 600;

  // Add more helper methods if necessary
}

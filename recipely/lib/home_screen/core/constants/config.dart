import 'package:flutter/material.dart';

class AppColors {
  static final Color primary = Color.fromRGBO(111, 185, 190, 1);
  static final Color secondary = Color.fromRGBO(10, 37, 51, 1);
  static final Color background = const Color.fromARGB(248, 255, 255, 255);
  static final Color shadow = const Color.fromARGB(255, 245, 245, 245);
}

class Assets {
  static final String sunIcon = 'assets/Sun.png';
  static final String notificationIcon = 'assets/Notification.png';
  static final String cartIcon = 'assets/Buy.png';
  static final String chefIcon = 'assets/Chef.png';
  static final String homeIcon = 'assets/Menu Icon.png';
  static final String searchIcon = 'assets/Search.png';
  static final String profileIcon = 'assets/Profile.png';
}

class TextStyleConstants {
  static final TextStyle headerStyle = TextStyle(
    fontWeight: FontWeight.w800,
    fontFamily: 'Sofia Pro',
    fontSize: 24,
    color: AppColors.secondary,
  );
  static final TextStyle bodyStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Sofia Pro',
    fontSize: 16,
    color: AppColors.secondary,
  );
}

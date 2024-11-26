import 'package:flutter/material.dart';
import 'package:ride_share/utils/app_colors.dart';

class AppStyles {
  static const titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: Colors.black,
  );

  static const subtitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: Color(0xFFB8B8B8),
  );

  static const cardTitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: Colors.black,
  );

  static const cardDetailStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: Color(0xFFB8B8B8),
  );

  static const buttonStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    color: Color(0xFF12D39D),
  );

  static const contentStyle = TextStyle(
    color: AppColors.textGray,
    fontSize: 16,
    fontFamily: 'Poppins',
  );

  static const hintStyle = TextStyle(
    color: Colors.grey,
  );

}

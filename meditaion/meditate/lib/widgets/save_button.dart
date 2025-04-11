import 'package:flutter/material.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/app_strings.dart';

class SaveButton extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final VoidCallback onTap;
  const SaveButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.9033816425120773,
        height: screenHeight * 0.0703125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            screenHeight * 0.04241071428571429,
          ),
          color: AppColors.accentColor,
        ),
        child: Center(
          child: Text(
            AppStrings.saveText,
            style: TextStyle(
              fontSize: screenHeight * 0.015625,
              fontWeight: FontWeight.normal,
              fontFamily: 'HelveticaNeue',
              color: const Color.fromRGBO(246, 241, 250, 1),
            ),
          ),
        ),
      ),
    );
  }
}

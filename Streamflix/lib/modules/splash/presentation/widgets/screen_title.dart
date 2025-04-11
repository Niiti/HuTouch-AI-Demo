import 'package:flutter/material.dart';
import 'package:my_project/core/constants/app_strings.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Text(
      AppStrings.splashScreenTitle,
      style: TextStyle(
        fontSize: screenHeight * 0.03,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}

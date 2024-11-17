import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import '../utils/app_colors.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Placeholder page for Next button functionality
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
        backgroundColor: AppColors.buttonColor,
      ),
      body: Center(
        child: Text(
          'This is the next page.',
          style: AppStyles.mainTextStyle,
        ),
      ),
    );
  }
}
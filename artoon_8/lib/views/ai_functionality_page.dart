import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/feature_model.dart';
import '../utils/app_styles.dart';
import '../utils/app_colors.dart';

class AIFunctionalityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FeatureModel feature = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(feature.mainText),
        backgroundColor: AppColors.buttonColor,
      ),
      body: Center(
        child: Text(
          feature.subText,
          style: AppStyles.mainTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
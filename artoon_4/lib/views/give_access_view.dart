import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/give_access_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'widgets/custom_button.dart';

class GiveAccessView extends StatelessWidget {
  final GiveAccessController controller = Get.put(GiveAccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.swipeIndicator,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  AppStrings.giveAccessTitle,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  AppStrings.giveAccessDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      text: AppStrings.notNow,
                      onPressed: controller.notNow,
                      color: AppColors.buttonNotNow,
                      textColor: AppColors.textPrimary,
                    ),
                    CustomButton(
                      text: AppStrings.letsDoIt,
                      onPressed: controller.letsDoIt,
                      color: AppColors.buttonBackground,
                      textColor: AppColors.secondary,
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

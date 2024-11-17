import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/feature_controller.dart';
import '../utils/app_styles.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../routes/app_routes.dart';
import 'list_item_widget.dart';

class HomePage extends StatelessWidget {
  final FeatureController featureController = Get.put(FeatureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppConstants.verticalPadding),
                  Center(
                    child: Text(
                      'Which features do you like the most?',
                      style: AppStyles.headerTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: AppConstants.verticalSpacing),
                  // List Items
                  ...featureController.features
                      .map(
                        (feature) => ListItemWidget(
                          feature: feature,
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.AI_FUNCTIONALITY,
                              arguments: feature,
                            );
                          },
                        ),
                      )
                      .toList(),
                  SizedBox(height: AppConstants.verticalSpacing),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.DASHBOARD);
                    },
                    child: Text('Next', style: AppStyles.buttonTextStyle),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: AppColors.buttonColor,
                      minimumSize: Size(double.infinity, AppConstants.buttonHeight),
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: AppConstants.verticalPadding),
                  // Advertisement Section
                  Container(
                    width: double.infinity,
                    height: AppConstants.adHeight,
                    color: AppColors.adBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Ad Placeholder Elements
                        Container(
                          width: 52,
                          height: 52,
                          color: AppColors.placeholderColor,
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          width: 208,
                          height: 18,
                          color: AppColors.placeholderColor,
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: 104,
                          height: 18,
                          color: AppColors.placeholderColor,
                        ),
                        SizedBox(height: 24.0),
                        Container(
                          width: 351,
                          height: 40,
                          color: AppColors.placeholderColor,
                          child: Center(
                            child: Text(
                              'Loading...',
                              style: AppStyles.adTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppConstants.verticalPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
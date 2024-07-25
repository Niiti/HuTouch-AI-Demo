import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'widgets/custom_button.dart';
import '../controllers/premium_controller.dart';
import 'ai_art_home_screen.dart';

class GoPremiumScreen extends StatelessWidget {
  final PremiumController premiumController = Get.put(PremiumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/logo.png', // Your logo asset
              height: 120,
              width: 120,
            ),
            SizedBox(height: 32.0),
            Text(
              AppStrings.goPremiumTitle,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              AppStrings.goPremiumDescription,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            CustomButton(
              text: AppStrings.goPremiumButton,
              color: AppColors.buttonBackground,
              textColor: Colors.white,
              onPressed: () {
              Get.to(() => AiArtHomeScreen());
              },
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                premiumController.skip();
              },
              child: Text(
                AppStrings.skipButton,
                style: TextStyle(
                  color: AppColors.buttonNotNow,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

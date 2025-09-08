import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/daily_challenge_home/views/daily_challenge_home_view.dart';
import 'package:build_me_up/modules/meal_capture_review/views/meal_capture_review_view.dart';
import 'package:build_me_up/modules/lunch_food_selection/views/lunch_food_selection_view.dart';

class CombinedScreens extends StatefulWidget {
  const CombinedScreens({super.key});

  @override
  State<CombinedScreens> createState() => _CombinedScreensState();
}

class _CombinedScreensState extends State<CombinedScreens> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final navHeight = context.heightUnit * 10.0;

    return Scaffold(
      body: const SafeArea(child: DailyChallengeHomeView()),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.navShadow,
              offset: Offset(0, -1),
              blurRadius: 5,
            ),
          ],
        ),
        child: NavigationBar(
          height: navHeight,
          selectedIndex: _index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              label: AppStrings.home,
            ),
            NavigationDestination(
              icon: Icon(Icons.local_fire_department),
              label: AppStrings.challenge,
            ),
            NavigationDestination(
              icon: Icon(Icons.restaurant_menu),
              label: AppStrings.recipesTab,
            ),
          ],
          onDestinationSelected: (i) {
            if (i == 0) {
              setState(() => _index = 0);
            } else if (i == 1) {
              Get.to(() => const MealCaptureReviewView());
              Get.to(() => const LunchFoodSelectionView());
            } else {
              Get.showSnackbar(
                const GetSnackBar(
                  message: 'This section will be available soon.',
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

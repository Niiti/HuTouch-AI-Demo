// lib/views/widgets/custom_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class CustomNavigationBar extends StatelessWidget {
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: controller.onBottomNavTapped,
        items: AppConstants.bottomNavItems.map((item) {
          int index = AppConstants.bottomNavItems.indexOf(item);
          return BottomNavigationBarItem(
            icon: item['icon'] != ''
                ? Image.asset(
                    item['icon']!,
                    width: 24.0,
                    height: 24.0,
                  )
                : Icon(
                    Icons.person,
                    color: controller.selectedIndex.value == index
                        ? AppColors.primaryColor
                        : AppColors.secondaryColor,
                  ),
            label: item['label'],
          );
        }).toList(),
      ),
    );
  }
}

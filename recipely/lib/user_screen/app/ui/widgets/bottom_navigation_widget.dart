import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../core/constants/design_constants.dart';

class BottomNavigationWidget extends StatelessWidget {
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeTab(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: controller.currentIndex.value == 0 ? AppColors.primaryColor : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: controller.currentIndex.value == 1 ? AppColors.primaryColor : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu, color: controller.currentIndex.value == 2 ? AppColors.primaryColor : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: controller.currentIndex.value == 3 ? AppColors.primaryColor : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: controller.currentIndex.value == 4 ? AppColors.primaryColor : Colors.grey),
              label: '',
            ),
          ],
        ));
  }
}

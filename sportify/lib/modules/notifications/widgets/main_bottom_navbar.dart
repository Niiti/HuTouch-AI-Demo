import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notif_controller.dart';
import '../../../constants/images_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class MainBottomNavBar extends StatelessWidget {
  final NotificationsController controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: controller.selectedIndex.value,
      selectedItemColor: AppColors.primary,
      onTap: (index) => controller.changeIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomHomeIcon,
            width: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomNewsIcon,
            width: 24,
          ),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomVideosIcon,
            width: 24,
          ),
          label: 'Videos',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomProfileIcon,
            width: 24,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

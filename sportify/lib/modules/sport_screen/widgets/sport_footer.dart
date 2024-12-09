// lib/modules/sport_screen/widgets/sport_footer.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/images_assets.dart';
import '../controllers/sport_controller.dart';
import '../../../utils/error_handler.dart';

class SportFooter extends StatelessWidget {
  final SportController controller = Get.find<SportController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesAsset.bottomHomeIcon,
              width: size.width * 0.07,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesAsset.bottomNewsIcon,
              width: size.width * 0.07,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesAsset.bottomVideosIcon,
              width: size.width * 0.07,
            ),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ImagesAsset.bottomProfileIcon,
              width: size.width * 0.07,
            ),
            label: 'User',
          ),
        ],
        selectedItemColor: AppColors.selectedItem,
        unselectedItemColor: AppColors.unselectedItem,
        onTap: (index) {
          controller.changeIndex(index);
          // Handle navigation based on index
        },
      ),
    );
  }
}

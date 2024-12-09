// lib/modules/dashboard/widgets/custom_footer.dart
import 'package:flutter/material.dart';
import '../../../constants/images_assets.dart';
import '../../../constants/app_colors.dart';

class CustomFooter extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomFooter({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.primaryRed,
      unselectedItemColor: AppColors.black,
      onTap: (index) {
        // Change index without navigating
        onTap(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomHomeIcon,
            width: 24,
            height: 24,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomNewsIcon,
            width: 24,
            height: 24,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomVideosIcon,
            width: 24,
            height: 24,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomProfileIcon,
            width: 24,
            height: 24,
          ),
          label: '',
        ),
      ],
    );
  }
}
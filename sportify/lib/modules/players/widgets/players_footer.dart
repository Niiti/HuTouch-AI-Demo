// lib/modules/dashboard/widgets/dashboard_footer.dart
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';

class PlayersFooter extends StatelessWidget {
  final double width;

  const PlayersFooter({required this.width});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(ImagesAsset.bottomHomeIcon, width: width * 0.075),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(ImagesAsset.bottomNewsIcon, width: width * 0.075),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(ImagesAsset.bottomVideosIcon, width: width * 0.075),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            ImagesAsset.bottomProfileIcon,
            width: width * 0.075,
            color: AppColors.primaryRed,
          ),
          label: '',
        ),
      ],
      onTap: (index) {},
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}

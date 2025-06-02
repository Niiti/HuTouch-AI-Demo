 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/nav_bar_item.dart';

class BottomNavBarSection extends StatelessWidget {
  const BottomNavBarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final horzPadding = width * 0.04;
    final vertPadding = height * 0.01;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horzPadding, vertical: vertPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Color.fromRGBO(43, 43, 43, 0.04), offset: Offset(0, -1))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          NavBarItem(assetPath: ImagesAsset.bottomHomeIcon, label: AppStrings.navExplore),
          NavBarItem(assetPath: ImagesAsset.bottomDiscoverIcon, label: AppStrings.navNearby),
          NavBarItem(assetPath: ImagesAsset.bottomCalendarIcon, label: AppStrings.navAppointment),
          NavBarItem(assetPath: ImagesAsset.bottomDownloadsIcon, label: AppStrings.navInbox),
          NavBarItem(assetPath: ImagesAsset.bottomProfileIcon, label: AppStrings.navProfile),
        ],
      ),
    );
  }
}
 

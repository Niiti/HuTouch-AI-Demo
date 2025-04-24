import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/features/tour/presentation/widgets/nav_bar_item.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(19, 19, 22, 1),
        border: Border.all(color: ColorPalette.border, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          NavBarItem(iconAsset: 'assets/images/bottom_home_icon.png', isActive: true),
          NavBarItem(iconAsset: 'assets/images/bottom_menu_icon.png'),
          NavBarItem(iconAsset: 'assets/images/bottom_bookmark_icon.png'),
          NavBarItem(iconAsset: 'assets/images/bottom_profile_icon.png'),
        ],
      ),
    );
  }
}
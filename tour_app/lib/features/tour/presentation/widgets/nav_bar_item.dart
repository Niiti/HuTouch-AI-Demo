import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';

class NavBarItem extends StatelessWidget {
  final String iconAsset;
  final bool isActive;
  const NavBarItem({super.key, required this.iconAsset, this.isActive = false});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Handle navigation
      },
      child: Image.asset(
        iconAsset,
        color: isActive ? ColorPalette.activeIcon : Colors.white,
        width: screenWidth * 0.06,
        height: screenWidth * 0.06,
      ),
    );
  }
}
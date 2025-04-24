import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NavBarIconItem(
              label: 'Shop',
              iconPath: 'assets/images/bottom_shop_icon.png',
              isActive: false,
            ),
            NavBarIconItem(
              label: 'Explore',
              iconPath: 'assets/images/bottom_explore_icon.png',
              isActive: false,
            ),
            NavBarIconItem(
              label: 'Cart',
              iconPath: 'assets/images/bottom_cart_icon.png',
              isActive: true,
            ),
            NavBarIconItem(
              label: 'Favourite',
              iconPath: 'assets/images/bottom_favourite_icon.png',
              isActive: false,
            ),
            NavBarIconItem(
              label: 'Account',
              iconPath: 'assets/images/bottom_favourite_icon.png',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarIconItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isActive;
  
  const NavBarIconItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isActive,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            child: Image.asset(
              iconPath,
              width: MediaQuery.of(context).size.height * 0.03,
              color: isActive
                  ? ColorPalette.primary
                  : const Color.fromRGBO(179, 179, 179, 1),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          Container(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                color: isActive ? ColorPalette.primary : ColorPalette.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// lib/features/coffee_shop/presentation/widgets/bottom_nav_bar_widget.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/color_palette.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorPalette.brown,
      unselectedItemColor: ColorPalette.grey,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            '${AppConstants.assetsPath}bottom_home_icon.png',
            width: 24,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            '${AppConstants.assetsPath}bottom_heart_icon.png',
            width: 24,
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            '${AppConstants.assetsPath}bottom_cart_icon.png',
            width: 24,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            '${AppConstants.assetsPath}bottom_notifications_icon.png',
            width: 24,
          ),
          label: 'Notifications',
        ),
      ],
    );
  }
}

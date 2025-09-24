// lib/features/coffee_shop/presentation/widgets/bottom_nav_bar_widget.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/color_palette.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorPalette.brown,
      unselectedItemColor: ColorPalette.grey,
      items: const [
        BottomNavigationBarItem(
          icon: _NavIcon('${AppConstants.assetsPath}bottom_home_icon.png'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon('${AppConstants.assetsPath}bottom_heart_icon.png'),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon('${AppConstants.assetsPath}bottom_cart_icon.png'),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: _NavIcon('${AppConstants.assetsPath}bottom_notifications_icon.png'),
          label: 'Notifications',
        ),
      ],
    );
  }
}

class _NavIcon extends StatelessWidget {
  final String path;
  const _NavIcon(this.path);

  @override
  Widget build(BuildContext context) {
    return Image.asset(path, width: 24);
  }
}

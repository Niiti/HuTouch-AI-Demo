import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';

class BottomNavigationBarSection extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;
  const BottomNavigationBarSection({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = MediaQuery.of(context).size.width * 0.07;
    final activeColor = ColorPalette.primary;
    final inactiveColor = ColorPalette.textSecondary;

    final items = [
      _BottomNavItem(
        label: AppStrings.shop,
        icon: ImagesAsset.shop,
        index: 0,
        route: '/shop',
      ),
      _BottomNavItem(
        label: AppStrings.explore,
        icon: ImagesAsset.explore,
        index: 1,
        route: '/explore',
      ),
      _BottomNavItem(
        label: AppStrings.cart,
        icon: ImagesAsset.cart,
        index: 2,
        route: '/cart',
      ),
      _BottomNavItem(
        label: AppStrings.favourite,
        icon: ImagesAsset.favourite,
        index: 3,
        route: '/favourite',
      ),
      _BottomNavItem(
        label: AppStrings.account,
        icon: ImagesAsset.account,
        index: 4,
        route: '/account',
      ),
    ];

    return Material(
      elevation: 8,
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.015,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              items.map((item) {
                final bool isSelected = currentIndex == item.index;
                return Expanded(
                  child: InkWell(
                    onTap: () => onTabChanged(item.index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            item.icon,
                            width: isSelected ? iconSize + 4 : iconSize,
                            height: isSelected ? iconSize + 4 : iconSize,
                            color: isSelected ? activeColor : inactiveColor,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.label,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.030,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                              color: isSelected ? activeColor : inactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class _BottomNavItem {
  final String label;
  final String icon;
  final int index;
  final String route;
  _BottomNavItem({
    required this.label,
    required this.icon,
    required this.index,
    required this.route,
  });
}

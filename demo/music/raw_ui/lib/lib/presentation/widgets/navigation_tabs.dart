import 'package:flutter/material.dart';

import 'app_constants.dart';

class NavigationTabs extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;
  final List<String> tabs = [
    'For you',
    'Relax',
    'Workout',
    'Travel',
    'Focus',
    'Energize'
  ];

  NavigationTabs({
    required this.selectedIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: EdgeInsets.only(top: AppConstants.smallSpacing),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppConstants.mediumSpacing),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              onTabTapped(index);
            },
            child: Container(
              margin: EdgeInsets.only(right: AppConstants.smallSpacing),
              padding: EdgeInsets.symmetric(horizontal: AppConstants.smallSpacing),
              height: 36,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Text(
                tabs[index],
                style: TextStyle(
                  color: isSelected
                      ? Colors.white.withOpacity(0.75)
                      : Colors.white.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  height: 1.25,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
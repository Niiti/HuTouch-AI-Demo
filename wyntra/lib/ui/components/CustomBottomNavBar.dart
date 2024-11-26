import 'package:flutter/material.dart';
import 'package:wyntra/constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> navItems = [
      {'icon': 'assets/home.png', 'label': 'HOME'},
      {'icon': 'assets/Categories.png', 'label': 'CATEGORIES'},
      {'icon': 'assets/Cart.png', 'label': 'MY CART'},
      {'icon': 'assets/more.png', 'label': 'MORE'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(-2, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyTextColor,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: onTap,
        items: List.generate(navItems.length, (index) {
          return BottomNavigationBarItem(
            icon: Image.asset(
              navItems[index]['icon']!,
              height: 24,
              width: 24,
              color: currentIndex == index
                  ? AppColors.primaryColor
                  : AppColors.greyTextColor,
            ),
            label: navItems[index]['label']!,
          );
        }),
      ),
    );
  }
}
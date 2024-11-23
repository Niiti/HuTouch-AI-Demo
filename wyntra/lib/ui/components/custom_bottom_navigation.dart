import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class CustomBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(-2, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          // Navigation functionality
        },
        selectedItemColor: AppColors.pinkColor,
        unselectedItemColor: AppColors.navIconColor,
        backgroundColor: AppColors.backgroundColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedLabelStyle: AppStyles.roboto10w600,
        unselectedLabelStyle: AppStyles.roboto10w400,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/home.png', height: 24, width: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Categories.png', height: 24, width: 24),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Cart.png', height: 24, width: 24),
            label: 'My Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/more.png', height: 24, width: 24),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
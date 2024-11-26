import 'package:flutter/material.dart';

import '../constants/constants.dart';
// import '../constants/app_styles.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 4; // Messages Screen Index

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    // Implement navigation to other screens as per index
    // For example:
    // if (selectedIndex == 0) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF754777).withOpacity(0.15),
            offset: const Offset(8, 0),
            blurRadius: 40,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home Icon
            IconButton(
              iconSize: 24,
              icon: Image.asset(
                'assets/home.png',
                color: selectedIndex == 0
                    ? AppColors.iconColor
                    : AppColors.iconColor.withOpacity(0.5),
              ),
              onPressed: () => _onItemTapped(0),
            ),
            // Matches Icon
            IconButton(
              iconSize: 24,
              icon: Image.asset(
                'assets/navig.png',
                color: selectedIndex == 1
                    ? AppColors.iconColor
                    : AppColors.iconColor.withOpacity(0.5),
              ),
              onPressed: () => _onItemTapped(1),
            ),
            // Add Icon
            Container(
              width: 62,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: IconButton(
                  iconSize: 24,
                  icon: const Icon(Icons.add, color: AppColors.whiteColor),
                  onPressed: () => _onItemTapped(2),
                ),
              ),
            ),
            // Statistics Icon
            IconButton(
              iconSize: 24,
              icon: Image.asset(
                'assets/people.png',
                color: selectedIndex == 3
                    ? AppColors.iconColor
                    : AppColors.iconColor.withOpacity(0.5),
              ),
              onPressed: () => _onItemTapped(3),
            ),
            // Messages Icon
            Container(
              width: 62,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: IconButton(
                  iconSize: 24,
                    icon: Image.asset(
                    'assets/message.png',
                    color: selectedIndex == 4
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withOpacity(0.5),
                  ),
                  onPressed: () => _onItemTapped(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
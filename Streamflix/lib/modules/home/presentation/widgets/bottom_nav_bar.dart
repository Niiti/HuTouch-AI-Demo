import 'package:flutter/material.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/modules/home/presentation/screens/genres_categories_screen.dart';
import 'package:my_project/modules/home/presentation/screens/home_screen.dart';
import 'package:my_project/modules/home/presentation/screens/webseries_screen.dart';
import 'package:my_project/modules/home/presentation/widgets/bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const BottomNavBar({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  @override
  Widget build(BuildContext context) {
    final navHeight = screenHeight * 0.1;
    return SizedBox(
      width: screenWidth,
      height: navHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenHeight * 0.03),
        child: Container(
          color: const Color.fromRGBO(56, 54, 54, 0.4),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavItem(
                iconAsset: 'assets/icons/home_ab.png',
                label: AppStrings.home,
                isSelected: selectedIndex == 0,
                onTap: () {
                  onItemTapped(0);
                  // Add navigation logic here for Home
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              BottomNavItem(
                iconAsset: 'assets/icons/myList.png',
                label: AppStrings.watchlist,
                isSelected: selectedIndex == 1,
                onTap: () {
                  onItemTapped(2);
                  // Add navigation logic here for Library
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebseriesScreen()),
                  );
                },
              ),
              BottomNavItem(
                iconAsset: 'assets/icons/library.png',
                label: AppStrings.library,
                isSelected: selectedIndex == 2,
                onTap: () {
                  onItemTapped(2);
                  // Add navigation logic here for Library
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenresCategoriesScreen(),
                    ),
                  );
                },
              ),
              BottomNavItem(
                iconAsset: 'assets/icons/downloads.png',
                label: AppStrings.downloads,
                isSelected: selectedIndex == 3,
                onTap: () {
                  onItemTapped(3);
                  // Add navigation logic here for Downloads
                  Navigator.pushNamed(context, '/downloads');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

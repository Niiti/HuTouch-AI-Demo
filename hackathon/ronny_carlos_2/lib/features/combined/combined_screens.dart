import 'package:flutter/material.dart';
import 'package:hackaton_end/core/constants/app_colors.dart';
import 'package:hackaton_end/core/constants/app_strings.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';
import 'package:hackaton_end/features/challenge/views/challenge_main_screen.dart';
import 'package:hackaton_end/features/home/views/home_screen.dart';
import 'package:hackaton_end/features/recipes/views/recipes_screen.dart';

class CombinedScreens extends StatefulWidget {
  const CombinedScreens({super.key});

  @override
  State<CombinedScreens> createState() => _CombinedScreensState();
}

class _CombinedScreensState extends State<CombinedScreens> {
  int _index = 1;

  final _pages = const [
    HomeScreen(),
    ChallengeMainScreen(),
    RecipesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Scaffold(
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: SizedBox(
        height: h * 10.5,
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flag_rounded),
              label: AppStrings.challenge,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu_outlined),
              label: AppStrings.recipesTab,
            ),
          ],
        ),
      ),
    );
  }
}

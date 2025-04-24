import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/l10n/app_localizations.dart';

class SearchBar_ extends StatelessWidget {
  const SearchBar_({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final localizations = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        // Trigger search functionality
      },
      child: Material(
        color: ColorPalette.cardBackground,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.025),
          child: Row(
            children: [
              Image.asset(
                'assets/images/search_icon.png',
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
              ),
              SizedBox(width: screenWidth * 0.02),
              Text(
                localizations.search,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: const Color.fromRGBO(86, 90, 102, 1),
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/bottom_menu_icon.png',
                width: screenWidth * 0.06,
                height: screenWidth * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
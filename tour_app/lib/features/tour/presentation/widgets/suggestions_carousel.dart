import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/features/tour/presentation/widgets/suggestion_card.dart';
import 'package:my_project/l10n/app_localizations.dart';

class SuggestionsCarousel extends StatelessWidget {
  const SuggestionsCarousel({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              localizations.suggestionsForYou,
              style: TextStyle(
                fontSize: screenHeight * 0.022,
                color: ColorPalette.primaryText,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to full suggestions list
              },
              child: Text(
                localizations.seeAll,
                style: TextStyle(
                  fontSize: screenHeight * 0.015,
                  color: ColorPalette.primaryText,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        SizedBox(
          height: screenHeight * 0.25,
          child: Scrollbar(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SuggestionCard(
                  imageAsset: 'assets/images/suggestion_image_1.png',
                  title: 'Nusa Pedina',
                  location: 'Bali, Indonesia',
                  rating: 4.5,
                ),
                SizedBox(width: screenWidth * 0.04),
                SuggestionCard(
                  imageAsset: 'assets/images/suggestion_image_2.png',
                  title: 'Wachau Forest',
                  location: 'river Danube, Austria',
                  rating: 4.8,
                ),
                SizedBox(width: screenWidth * 0.04),
                SuggestionCard(
                  imageAsset: 'assets/images/image - 2025-04-21T095245.576.png',
                  title: 'Tromso',
                  location: 'Norway',
                  rating: 4.8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
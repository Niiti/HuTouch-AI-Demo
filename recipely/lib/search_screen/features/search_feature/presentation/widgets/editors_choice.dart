import 'package:flutter/material.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';
import 'package:recipely/search_screen/core/utils/responsive_helper.dart';

import 'editors_choice_card.dart';

class EditorsChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = ResponsiveHelper.getWidth(context, 0.04);
    double height = ResponsiveHelper.getHeight(context, 0.02);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Editor's Choice",
                style: TextStyle(
                  fontSize: ResponsiveHelper.getWidth(context, 0.05),
                  fontWeight: FontWeight.bold,
                  color: AppSettings.accentColor,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: ResponsiveHelper.getWidth(context, 0.04),
                  fontWeight: FontWeight.bold,
                  color: AppSettings.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: height),
          EditorsChoiceCard(
            title: 'Easy homemade beef burger',
            imageUrl: 'assets/healthy_tako.png',
            creators: ['James Spader'],
          ),
          SizedBox(height: height),
          EditorsChoiceCard(
            title: 'Blueberry with egg for breakfast',
            imageUrl: 'assets/Japanese_food.png',
            creators: ['Alice Fala'],
          ),
        ],
      ),
    );
  }
}

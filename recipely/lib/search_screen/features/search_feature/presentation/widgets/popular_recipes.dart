import 'package:flutter/material.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';
import 'package:recipely/search_screen/core/utils/responsive_helper.dart';

import 'recipe_card.dart';

class PopularRecipes extends StatelessWidget {
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
                'Popular Recipes',
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
          Container(
            height: ResponsiveHelper.getHeight(context, 0.2),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RecipeCard(
                  title: 'Egg & Avocado',
                  imageUrl: 'assets/food_element1.png',
                ),
                SizedBox(width: ResponsiveHelper.getWidth(context, 0.04)),
                RecipeCard(
                  title: 'Bowl of Rice',
                  imageUrl: 'assets/food_element2.png',
                ),
                SizedBox(width: ResponsiveHelper.getWidth(context, 0.04)),
                RecipeCard(
                  title: 'Chicken Salad',
                  imageUrl: 'assets/food_element3.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';
import 'package:recipely/search_screen/core/utils/responsive_helper.dart';

import '../../../../../recipe_detail/app/ui/pages/recipe_detail_page.dart';


class EditorsChoiceCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<String> creators;

  const EditorsChoiceCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.creators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = ResponsiveHelper.getWidth(context, 0.04);
    double height = ResponsiveHelper.getHeight(context, 0.12);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSettings.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(106, 163, 166, 0.1),
            offset: Offset(0, 2),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 8),
          Container(
            height: ResponsiveHelper.getHeight(context, 0.1),
            width: ResponsiveHelper.getWidth(context, 0.22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSettings.borderRadius),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: ResponsiveHelper.getWidth(context, 0.04)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.getHeight(context, 0.02)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.length > 25 ? '${title.substring(0, 25)}...' : title,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.getWidth(context, 0.04),
                      fontWeight: FontWeight.bold,
                      color: AppSettings.accentColor,
                    ),
                  ),
                  Spacer(),
                  Row(
  children: creators
      .map((creator) => Padding(
            padding: EdgeInsets.only(right: ResponsiveHelper.getWidth(context, 0.02)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: ResponsiveHelper.getWidth(context, 0.03),
                  backgroundImage: AssetImage(AppSettings.userAvatar),
                ),
                SizedBox(width: 4),
                Text(
                  creator,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.getWidth(context, 0.035),
                    color: Color(0xFF97A2B1),
                  ),
                ),
              ],
            ),
          ))
      .toList(), // Convert Iterable to List
),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailPage(),
              ),
            );
            // Define your onTap action here
          },
          child: CircleAvatar(
            radius: ResponsiveHelper.getWidth(context, 0.04),
            backgroundColor: AppSettings.accentColor,
            child: Icon(Icons.arrow_forward, color: Colors.white, size: ResponsiveHelper.getWidth(context, 0.05)),
          ),
          ),
        ],
      ),
    );
  }
}
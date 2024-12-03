import 'package:flutter/material.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';
import 'package:recipely/search_screen/core/utils/responsive_helper.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = ResponsiveHelper.getWidth(context, 0.25);
    return Container(
      width: width,
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
      child: Column(
        children: [
          Container(
            height: width,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSettings.borderRadius),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title.length > 10 ? '${title.substring(0, 10)}...' : title,
            style: TextStyle(
              fontSize: ResponsiveHelper.getWidth(context, 0.035),
              color: AppSettings.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}

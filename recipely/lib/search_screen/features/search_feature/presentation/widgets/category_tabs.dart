import 'package:flutter/material.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';
import 'package:recipely/search_screen/core/utils/responsive_helper.dart';

class CategoryTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = ResponsiveHelper.getWidth(context, 0.04);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: AppSettings.primaryColor,
            ),
            child: Text(
              'Breakfast',
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveHelper.getWidth(context, 0.04),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Lunch',
              style: TextStyle(
                color: AppSettings.accentColor,
                fontSize: ResponsiveHelper.getWidth(context, 0.04),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Dinner',
              style: TextStyle(
                color: AppSettings.accentColor,
                fontSize: ResponsiveHelper.getWidth(context, 0.04),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

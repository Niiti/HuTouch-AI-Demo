import 'package:flutter/material.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';
import 'package:recipely/search_screen/core/utils/responsive_helper.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = ResponsiveHelper.getWidth(context, 0.04);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.arrow_back, color: AppSettings.accentColor),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: ResponsiveHelper.getWidth(context, 0.065),
                  fontWeight: FontWeight.bold,
                  color: AppSettings.accentColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

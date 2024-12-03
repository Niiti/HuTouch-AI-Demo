import 'package:flutter/material.dart';
import 'package:recipely/search_screen/core/constants/app_settings.dart';

import '../../../../core/utils/responsive_helper.dart';

class BottomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;

  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = ResponsiveHelper.getWidth(context, 0.07);
    double fontSize = ResponsiveHelper.getWidth(context, 0.03);
    Color iconColor = isSelected ? AppSettings.primaryColor : Color(0xFF97A2B1);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon,
          width: iconSize,
          color: iconColor,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}

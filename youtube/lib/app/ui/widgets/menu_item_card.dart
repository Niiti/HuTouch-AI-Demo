import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class MenuItemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double iconSize;
  final VoidCallback? onTap; // Add onTap callback

  MenuItemCard({
    required this.icon,
    required this.title,
    this.subtitle = '',
    this.iconSize = 24.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap, // Use the onTap callback
      child: Padding(
        padding: EdgeInsets.only(bottom: AppConstants.paddingMedium),
        child: Row(
          children: [
            Icon(icon, size: iconSize),
            SizedBox(width: AppConstants.paddingMedium),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style:
                        TextStyle(color: AppConstants.greyColor, fontSize: 14),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
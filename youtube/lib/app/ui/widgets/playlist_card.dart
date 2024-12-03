import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class PlaylistCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final double iconSize;

  PlaylistCard({
    required this.icon,
    required this.title,
    this.subtitle = '',
    this.color = Colors.black,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.paddingMedium),
      child: Row(
        children: [
          Icon(icon, color: color, size: iconSize),
          SizedBox(width: AppConstants.paddingMedium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 16, color: color, fontWeight: FontWeight.bold),
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(color: AppConstants.greyColor, fontSize: 14),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class LikesConnectIcon extends StatelessWidget {
  final String iconAsset;
  final int count;
  final String label;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  LikesConnectIcon({
    required this.iconAsset,
    required this.count,
    required this.label,
    required this.gradientColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: primaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(32),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Image.asset(
                iconAsset,
                width: 32,
                height: 32,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '$label $count',
            style: labelTextStyle,
          ),
        ],
      ),
    );
  }
}

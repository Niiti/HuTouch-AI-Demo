import 'package:flutter/material.dart';
import '../../constants/app_styles.dart';

class CategoryIcon extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  CategoryIcon({
    required this.imagePath,
    required this.label,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 32,
                width: 32,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: AppStyles.categoryLabelStyle,
          ),
        ],
      ),
    );
  }
}

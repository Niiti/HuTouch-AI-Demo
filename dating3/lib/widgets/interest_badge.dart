// File: lib/widgets/interest_badge.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class InterestBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  InterestBadge({
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.lightGreyColor,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.badgeText.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

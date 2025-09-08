import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class DayChip extends StatelessWidget {
  const DayChip({super.key, required this.dayNumber, required this.active});

  final int dayNumber;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final cardRadius = BorderRadius.circular(context.heightUnit * 1.2);
    final boxWidth = context.widthUnit * 14.0;
    final boxHeight = context.heightUnit * 6.5;

    return Container(
      width: boxWidth,
      height: boxHeight,
      decoration: BoxDecoration(
        color: AppColors.accentGreen,
        borderRadius: cardRadius,
      ),
      padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dayNumber.toString().padLeft(2, '0'),
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: context.heightUnit * 2.0,
            ),
          ),
          Icon(
            Icons.local_fire_department,
            color: active ? AppColors.warning : AppColors.subtleText,
            size: context.heightUnit * 2.6,
          ),
        ],
      ),
    );
  }
}

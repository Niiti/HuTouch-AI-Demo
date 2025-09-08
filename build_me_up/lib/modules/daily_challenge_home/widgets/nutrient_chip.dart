import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class NutrientChip extends StatelessWidget {
  const NutrientChip({
    super.key,
    required this.label,
    required this.current,
    required this.total,
  });

  final String label;
  final double current;
  final double total;

  @override
  Widget build(BuildContext context) {
    final diameter = context.heightUnit * 8.0;
    final stroke = context.heightUnit * 0.6;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: diameter,
          height: diameter,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.ringGreen, width: stroke),
                ),
              ),
              Text(
                '[0m${current.toInt()}/\n${total.toInt()}g',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: context.heightUnit * 1.4,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: context.widthUnit * 2.5),
        Text(
          label,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
            fontSize: context.heightUnit * 1.6,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meditate/core/constants/app_colors.dart';

class DayButton extends StatelessWidget {
  final String label;
  final bool selected;
  final double screenHeight;
  final VoidCallback onTap;
  const DayButton({
    super.key,
    required this.label,
    required this.selected,
    required this.screenHeight,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final double diameter = screenHeight * 0.04547579799379621;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? AppColors.primaryColor : Colors.transparent,
          border:
              selected
                  ? null
                  : Border.all(color: AppColors.secondaryColor, width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.015625,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.normal,
              color: selected ? Colors.white : AppColors.secondaryColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

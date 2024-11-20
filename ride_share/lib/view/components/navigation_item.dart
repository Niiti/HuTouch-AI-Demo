import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class NavigationItem extends StatelessWidget {
  final String asset;
  final String label;
  final bool isActive;

  NavigationItem({required this.asset, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: isActive
              ? BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 6.0),
                )
              : BoxDecoration(),
          child: Image.asset(
            asset,
            color: isActive ? Colors.white : AppColors.text,
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: AppColors.text),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/constants/config.dart';
import '../../core/utils/responsive.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    required Key key,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        backgroundColor:
            isSelected ? AppColors.primary : Color.fromRGBO(241, 245, 245, 1),
        label: Text(
          label,
          style: TextStyle(
            fontSize: responsiveWidth(context, 0.04),
            fontFamily: 'Sofia Pro',
            fontWeight: FontWeight.normal,
            color: isSelected ? Colors.white : AppColors.secondary,
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 0.06),
            vertical: responsiveWidth(context, 0.015)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

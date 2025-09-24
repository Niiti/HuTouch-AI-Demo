import 'package:flutter/material.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class CategoryPillButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const CategoryPillButton({super.key, required this.label, required this.selected, this.onTap});
  @override
  Widget build(BuildContext context) {
    final height = context.heightUnit * 4.6;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height),
      child: Material(
        color: selected ? AppColors.chipSelected : AppColors.chipUnselected,
        borderRadius: BorderRadius.circular(height),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 4),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : AppColors.textPrimary,
                  fontSize: context.heightUnit * 1.8,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

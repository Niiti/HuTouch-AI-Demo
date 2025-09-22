import 'package:flutter/material.dart';
import 'package:hackaton_end/core/constants/app_colors.dart';
import 'package:hackaton_end/core/extensions/context_extensions.dart';

class MealCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String progressText;
  final VoidCallback onAdd;

  const MealCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.progressText,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 2.5),
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(h * 2)),
      child: Material(
        color: Colors.transparent,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: w * 12,
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(h * 2.5)),
                alignment: Alignment.center,
                child: Icon(icon, color: AppColors.primary, size: h * 2.4),
              ),
              SizedBox(width: w * 4),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: h * 1.6, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                    SizedBox(height: h * 0.7),
                    Text(progressText, style: TextStyle(fontSize: h * 1.35, color: AppColors.textPrimary)),
                  ],
                ),
              ),
              SizedBox(width: w * 2),
              Material(
                clipBehavior: Clip.antiAlias,
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(999),
                child: InkWell(
                  onTap: onAdd,
                  child: SizedBox(
                    width: h * 3.6,
                    height: h * 3.6,
                    child: Icon(Icons.add, color: Colors.white, size: h * 2.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/core/constants/app_strings.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class SectionHeaderWithSeeAll extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback? onTap;
  const SectionHeaderWithSeeAll({super.key, required this.title, this.onTap, this.actionLabel = AppStrings.seeAll});
  @override
  Widget build(BuildContext context) {
    final titleSize = context.heightUnit * 2.3;
    final seeAllSize = context.heightUnit * 1.6;
    return Row(
      children: [
        Expanded(
          child: Text(title, style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        ),
        Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(context.widthUnit * 2),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 2.5, vertical: context.heightUnit * 0.8),
              child: Text(actionLabel, style: TextStyle(fontSize: seeAllSize, fontWeight: FontWeight.w800, color: AppColors.primary)),
            ),
          ),
        ),
      ],
    );
  }
}

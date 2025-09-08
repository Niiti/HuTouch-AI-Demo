import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class SectionsHeader extends StatelessWidget {
  const SectionsHeader({
    super.key,
    required this.title,
    required this.onSeeMore,
  });

  final String title;
  final VoidCallback onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.w700,
              fontSize: context.heightUnit * 2.0,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onSeeMore,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthUnit * 2.5,
                vertical: context.heightUnit * 0.5,
              ),
              child: Text(
                AppStrings.seeMore,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: context.heightUnit * 1.6,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

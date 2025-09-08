import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/meal_capture_review/controllers/meal_capture_review_controller.dart';

class ActionLinksRow extends GetView<MealCaptureReviewController> {
  const ActionLinksRow({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.widthUnit * 4;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 6),
      child: Row(
        children: [
          Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            child: InkWell(
              onTap: controller.takeAnotherPhoto,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing * 0.5,
                  vertical: context.heightUnit * 0.8,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: AppColors.primary,
                      size: context.heightUnit * 2.2,
                    ),
                    SizedBox(width: spacing * 0.25),
                    Text(
                      AppStrings.takeAnotherPhoto,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.transparent,
            child: InkWell(
              onTap: controller.toggleSearch,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing * 0.5,
                  vertical: context.heightUnit * 0.8,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.primary,
                      size: context.heightUnit * 2.0,
                    ),
                    SizedBox(width: spacing * 0.25),
                    Text(
                      AppStrings.search,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

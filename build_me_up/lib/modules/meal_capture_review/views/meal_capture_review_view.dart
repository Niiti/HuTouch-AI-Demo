// file: lib/modules/meal_capture_review/views/meal_capture_review_view.dart
import 'package:build_me_up/widgets/buttons/hacker_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_dimensions.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart' as cx;
import 'package:build_me_up/modules/meal_capture_review/controllers/meal_capture_review_controller.dart';
import 'package:build_me_up/modules/meal_capture_review/widgets/action_links_row.dart';
import 'package:build_me_up/shared/components/meal-list-item.dart';
import 'package:build_me_up/shared/components/header-section-panel.dart';
import 'package:build_me_up/shared/components/user-avatar-icon-button.dart';
import 'package:build_me_up/shared/components/input-text-field.dart';

class MealCaptureReviewView extends GetView<MealCaptureReviewController> {
  const MealCaptureReviewView({super.key});

  @override
  MealCaptureReviewController get controller =>
      Get.put(MealCaptureReviewController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    final isPortrait = cx.ContextExtensionss(context).isPortrait;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: context.heightUnit * 2),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top bar
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.widthUnit * 4,
                        vertical: context.heightUnit * 1.5,
                      ),
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: controller.onBack,
                              borderRadius: BorderRadius.circular(999),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  context.heightUnit * 0.8,
                                ),
                                child: Icon(
                                  Icons.chevron_left,
                                  size: context.heightUnit * 3.0,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: context.widthUnit * 2),
                          Expanded(
                            child: Text(
                              AppStrings.breakfast,
                              style: context.textTheme.titleLarge?.copyWith(
                                color: AppColors.textDark,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: context.widthUnit * 2),
                          UserAvatarIconButton(
                            onTap: controller.openProfile,
                            size: context.heightUnit * 4.2,
                            backgroundColor: AppColors.primary,
                          ),
                        ],
                      ),
                    ),

                    // Header section
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.widthUnit * 6,
                        ),
                        child: HeaderSectionPanel(
                          height:
                              isPortrait
                                  ? context.heightUnit * 10.8
                                  : context.widthUnit * 10.8,
                          backgroundColor: AppColors.banner,
                          title: controller.mealName.value,
                          subtitle:
                              '${controller.consumedCalories.value}/${controller.totalCalories.value} ${AppStrings.caloriesSuffix}',
                          textColor: AppColors.textDark,
                        ),
                      ),
                    ),

                    const ActionLinksRow(),

                    // Optional search
                    Obx(
                      () =>
                          controller.showSearch.value
                              ? Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.widthUnit * 6,
                                  vertical: context.heightUnit * 1,
                                ),
                                child: InputTextField(
                                  height: context.heightUnit * 5.4,
                                  hintText: AppStrings.search,
                                  textInputAction: TextInputAction.search,
                                  keyboardType: TextInputType.text,
                                ),
                              )
                              : const SizedBox.shrink(),
                    ),

                    // Items list + Add button
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.widthUnit * 6,
                        vertical: context.heightUnit * 1.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          // If your project exposes radiusXL, keep it.
                          // The original error says radiusXL is missing; many codebases use radiusXl.
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusXL,
                          ),
                        ),
                        padding: EdgeInsets.all(context.widthUnit * 4),
                        child: Column(
                          children: [
                            Obx(
                              () => ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.filteredItems.length,
                                separatorBuilder:
                                    (_, __) => SizedBox(
                                      height: context.heightUnit * 2,
                                    ),
                                itemBuilder: (_, index) {
                                  final item = controller.filteredItems[index];
                                  final reactive = controller.allItems
                                      .firstWhere((e) => e.id == item.id);
                                  return MealListItem(
                                    imagePath: reactive.assetPath,
                                    title: reactive.name,
                                    subtitle:
                                        '${reactive.caloriesPerServing} ${AppStrings.caloriesSuffix}',
                                    value: reactive.qty,
                                    onIncrement:
                                        () => controller.increment(reactive.id),
                                    onDecrement:
                                        () => controller.decrement(reactive.id),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height:
                                  isPortrait
                                      ? context.heightUnit * 3
                                      : context.widthUnit * 3,
                            ),
                            Center(
                              child: Obx(
                                () => PrimaryButton(
                                  text: AppStrings.add,
                                  onPressed:
                                      controller.isAdding.value
                                          ? () {}
                                          : controller.addSelected,
                                  height:
                                      isPortrait
                                          ? context.heightUnit * 5.6
                                          : context.widthUnit * 5.6,
                                  borderRadius: BorderRadius.circular(
                                    context.heightUnit * 2.6,
                                  ),
                                  enabled: !controller.isAdding.value,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

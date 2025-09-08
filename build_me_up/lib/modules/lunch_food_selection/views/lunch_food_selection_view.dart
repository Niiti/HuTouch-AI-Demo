import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/lunch_food_selection/controllers/lunch_food_controller.dart';
import 'package:build_me_up/modules/lunch_food_selection/widgets/food_list_card.dart';
import 'package:build_me_up/shared/components/header-section-panel.dart';
import 'package:build_me_up/shared/components/user-avatar-icon-button.dart';

class LunchFoodSelectionView extends StatelessWidget {
  const LunchFoodSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LunchFoodController(), permanent: false);
    final c = Get.find<LunchFoodController>();

    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.textDark,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.widthUnit * 4,
                vertical: context.heightUnit * 1.6,
              ),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(40),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: c.onBack,
                      child: Padding(
                        padding: EdgeInsets.all(context.heightUnit * 0.8),
                        child: Icon(
                          Icons.chevron_left,
                          size: context.heightUnit * 3.2,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: context.widthUnit * 2),
                  Expanded(
                    child: Text(
                      'Lunch',
                      style: titleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  UserAvatarIconButton(
                    onTap: c.openProfile,
                    size: context.heightUnit * 4.2,
                    backgroundColor: AppColors.primary,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 6),
              child: Obx(
                () => HeaderSectionPanel(
                  height: context.heightUnit * 9.6,
                  backgroundColor: AppColors.banner,
                  title: 'Lunch',
                  subtitle:
                      '${c.totalCalories}/${c.targetCalories} ${AppStrings.caloriesSuffix}',
                  textColor: AppColors.textDark,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: context.heightUnit * 2.2,
                left: context.widthUnit * 6,
                right: context.widthUnit * 6,
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Material(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: c.toggleSearch,
                      child: Padding(
                        padding: EdgeInsets.all(context.heightUnit * 0.6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search,
                              color: AppColors.primary,
                              size: context.heightUnit * 2.2,
                            ),
                            SizedBox(width: context.widthUnit * 2),
                            Text(
                              AppStrings.search,
                              style: Theme.of(
                                context,
                              ).textTheme.titleSmall?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child:
                    c.searchVisible.value
                        ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.widthUnit * 6,
                          ),
                          child: Material(
                            color: const Color(0xFFE8E8E8),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.widthUnit * 3,
                              ),
                              child: TextField(
                                controller: c.searchController,
                                onChanged: (v) => c.query.value = v,
                                decoration: const InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.search,
                              ),
                            ),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
            ),
            SizedBox(height: context.heightUnit * 1.2),
            const Expanded(child: FoodListCard()),
            SizedBox(height: context.heightUnit * 2),
          ],
        ),
      ),
    );
  }
}

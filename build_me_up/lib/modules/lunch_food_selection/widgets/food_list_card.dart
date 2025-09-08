import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart' as cx;
import 'package:build_me_up/modules/lunch_food_selection/controllers/lunch_food_controller.dart';
import 'package:build_me_up/modules/lunch_food_selection/models/lunch_food_item.dart';
import 'package:build_me_up/modules/lunch_food_selection/widgets/food_quantity_stepper.dart';

class FoodListCard extends StatelessWidget {
  const FoodListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = cx.ContextExtensionss(context).isPortrait;
    final maxListHeight =
        isPortrait ? context.screenHeight * 0.52 : context.screenHeight * 0.62;
    final c = Get.find<LunchFoodController>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 6),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.widthUnit * 4,
          vertical: context.heightUnit * 2.4,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxListHeight),
          child: Scrollbar(
            thickness: context.widthUnit * 0.8,
            child: Obx(() {
              final data = c.items;
              return ListView.separated(
                itemCount: data.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder:
                    (_, __) => SizedBox(height: context.heightUnit * 2.4),
                itemBuilder: (context, index) {
                  final LunchFoodItem item = data[index];
                  return _RowItem(item: item);
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({required this.item});
  final LunchFoodItem item;

  @override
  Widget build(BuildContext context) {
    final imageSize = context.heightUnit * 6.2;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(context.heightUnit * 1.2),
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.imagePath,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.medium,
              ),
            ),
            SizedBox(width: context.widthUnit * 4),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: context.heightUnit * 0.6),
                  Text(
                    item.gramsLabel != null
                        ? '${item.calories} Cal (${item.gramsLabel})'
                        : '${item.calories} Cal',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w300,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: context.widthUnit * 2),
            FoodQuantityStepper(item: item),
          ],
        ),
      ),
    );
  }
}

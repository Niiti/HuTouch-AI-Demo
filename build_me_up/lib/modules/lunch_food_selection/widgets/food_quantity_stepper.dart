import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/lunch_food_selection/controllers/lunch_food_controller.dart';
import 'package:build_me_up/modules/lunch_food_selection/models/lunch_food_item.dart';

class FoodQuantityStepper extends StatelessWidget {
  const FoodQuantityStepper({super.key, required this.item});
  final LunchFoodItem item;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LunchFoodController>();
    final size = context.heightUnit * 3.4;

    Widget circle(VoidCallback onTap, IconData icon) {
      return Material(
        color: AppColors.muted,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(icon, size: size * 0.45, color: Colors.white),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        circle(() => c.decrement(item), Icons.remove),
        SizedBox(width: context.widthUnit * 2),
        Obx(
          () => Text(
            item.quantity.value.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(width: context.widthUnit * 2),
        circle(() => c.increment(item), Icons.add),
      ],
    );
  }
}

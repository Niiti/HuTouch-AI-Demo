import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/recipe_controller.dart';
import '../../../data/app_constants.dart';
import '../../../core/utils/responsive_util.dart';

class IngredientListHeader extends StatelessWidget {
  final RecipeController controller = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);
    final height = ResponsiveUtil.getHeight(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients',
              style: TextStyle(
                fontFamily: 'Sofia Pro',
                fontWeight: FontWeight.w800,
                fontSize: width * 0.045,
                color: AppConstants.secondaryColor,
              ),
            ),
            Text(
              '${controller.ingredientQuantities.length} Items',
              style: TextStyle(
                fontFamily: 'Sofia Pro',
                fontSize: width * 0.035,
                color: Color.fromRGBO(116, 129, 137, 1),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            controller.addAllToCart();
          },
          child: Text(
            'Add All to Cart',
            style: TextStyle(
              fontFamily: 'Sofia Pro',
              fontWeight: FontWeight.w800,
              fontSize: width * 0.04,
              color: Color.fromRGBO(111, 185, 190, 1),
            ),
          ),
        ),
      ],
    );
  }
}

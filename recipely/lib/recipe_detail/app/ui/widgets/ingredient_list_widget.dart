import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/recipe_controller.dart';
import '../../../core/utils/responsive_util.dart';
import '../../../data/models/ingredient_model.dart';

class IngredientListWidget extends StatelessWidget {
  final RecipeController controller = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);

    return Obx(() {
      return Column(
        children: controller.ingredientQuantities.keys.map((ingredient) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(5, 51, 54, 0.1),
                    blurRadius: 16,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: width * 0.06,
                    backgroundImage: AssetImage('assets/food_element1.png'),
                    backgroundColor: Colors.blueGrey.shade50,
                  ),
                  SizedBox(width: width * 0.05),
                  Expanded(
                    child: Text(
                      ingredient,
                      style: TextStyle(
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w800,
                        fontSize: width * 0.04,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      _counterButton(Icons.remove, width, ingredient),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Text(
                          '${controller.ingredientQuantities[ingredient]}',
                          style: TextStyle(
                            fontFamily: 'Sofia Pro',
                            fontSize: width * 0.04,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      _counterButton(Icons.add, width, ingredient),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      );
    });
  }

  Widget _counterButton(IconData icon, double width, String ingredient) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.remove) {
          controller.updateIngredient(ingredient, -1);
        } else {
          controller.updateIngredient(ingredient, 1);
        }
      },
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.teal, width: 1.5),
        ),
        child: Icon(
          icon,
          size: width * 0.045,
          color: Colors.teal,
        ),
      ),
    );
  }
}

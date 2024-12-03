import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/recipe_controller.dart';
import '../widgets/nutrition_info_widget.dart';
import '../widgets/ingredient_list_widget.dart';
import '../widgets/instructions_widget.dart';
import '../widgets/add_cart_button_widget.dart';
import '../widgets/creator_profile_widget.dart';
import '../widgets/related_recipes_widget.dart';
import '../widgets/tab_row_widget.dart';
import '../widgets/ingredient_list_header.dart';
import '../../../core/utils/responsive_util.dart';

class RecipeDetailPage extends StatelessWidget {
  final RecipeController controller = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    final height = ResponsiveUtil.getHeight(context);
    final width = ResponsiveUtil.getWidth(context);

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: height * 0.35,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/healthy_tako.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.07,
                  left: width * 0.05,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.close, size: width * 0.08, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.07,
                  right: width * 0.05,
                  child: GestureDetector(
                    onTap: () {
                      controller.toggleFavorite();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Obx(() => Icon(
                            controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                            color: controller.isFavorite.value ? Colors.red : Colors.black,
                            size: width * 0.08,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Healthy Taco Salad',
                    style: TextStyle(
                      fontFamily: 'Sofia Pro',
                      fontWeight: FontWeight.w800,
                      fontSize: width * 0.06,
                      color: Color.fromRGBO(10, 37, 51, 1),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.alarm, size: width * 0.05, color: Color.fromRGBO(116, 129, 137, 1)),
                      SizedBox(width: width * 0.01),
                      Text(
                        '15 Min',
                        style: TextStyle(
                          fontFamily: 'Sofia Pro',
                          fontSize: width * 0.035,
                          color: Color.fromRGBO(116, 129, 137, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'This Healthy Taco Salad is the universal delight of taco night',
                    style: TextStyle(
                      fontFamily: 'Sofia Pro',
                      fontSize: width * 0.04,
                      color: Color.fromRGBO(115, 129, 137, 1),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View More',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 38, 40, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  NutritionInfoWidget(),
                  SizedBox(height: height * 0.03),
                  TabRowWidget(),
                  SizedBox(height: height * 0.02),
                  Obx(() {
                    if (controller.activeTab.value == 'Ingredients') {
                      return Column(
                        children: [
                          IngredientListHeader(),
                          IngredientListWidget(),
                        ],
                      );
                    } else {
                      return InstructionsWidget();
                    }
                  }),
                  SizedBox(height: height * 0.03),
                  AddToCartButtonWidget(),
                  SizedBox(height: height * 0.03),
                  Divider(),
                  SizedBox(height: height * 0.02),
                  CreatorProfileWidget(),
                  SizedBox(height: height * 0.03),
                  RelatedRecipesWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

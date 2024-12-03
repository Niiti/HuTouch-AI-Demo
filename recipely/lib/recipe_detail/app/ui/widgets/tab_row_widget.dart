import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/recipe_controller.dart';
import '../../../data/app_constants.dart';
import '../../../core/utils/responsive_util.dart';

class TabRowWidget extends StatelessWidget {
  final RecipeController controller = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.setActiveTab('Ingredients');
            },
            child: Obx(() => Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: controller.activeTab.value == 'Ingredients'
                        ? AppConstants.secondaryColor
                        : Colors.blueGrey.shade100,
                  ),
                  child: Center(
                    child: Text(
                      'Ingredients',
                      style: TextStyle(
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04,
                        color: controller.activeTab.value == 'Ingredients'
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              controller.setActiveTab('Instructions');
            },
            child: Obx(() => Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: controller.activeTab.value == 'Instructions'
                        ? AppConstants.secondaryColor
                        : Colors.blueGrey.shade100,
                  ),
                  child: Center(
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04,
                        color: controller.activeTab.value == 'Instructions'
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

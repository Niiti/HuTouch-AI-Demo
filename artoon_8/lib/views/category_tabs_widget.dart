import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../../utils/app_styles.dart';
import '../../utils/app_constants.dart';

class CategoryTabsWidget extends StatelessWidget {
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0, // Fixed height for proper layout
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: AppConstants.categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.0),
        itemBuilder: (context, index) {
          String category = AppConstants.categories[index];
          return GestureDetector(
            onTap: () => controller.onCategorySelected(category),
            child: Obx(
              () {
                bool isSelected = controller.selectedCategory.value == category;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category,
                      style: isSelected
                          ? AppStyles.categorySelected
                          : AppStyles.categoryUnselected,
                    ),
                    SizedBox(height: 4.0),
                    isSelected
                        ? Container(
                            width: 70.0,
                            height: 2.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFF0F6FF),
                                  Color(0xFF0181FD),
                                  Color(0xFFF0F6FF),
                                ],
                                stops: [0.0, 0.549, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          )
                        : SizedBox(height: 2.0),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
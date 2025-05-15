import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/features/explore_screen/controllers/explore_controller.dart';
import 'package:nectorfigma/features/home_screen/widgets/custom_search_widget.dart';
import 'package:nectorfigma/features/explore_screen/widgets/find_products_section.dart';
import 'package:nectorfigma/features/explore_screen/widgets/product_cards_grid.dart';
import 'package:nectorfigma/features/home_screen/widgets/bottom_navbar_section.dart';

class ExploreScreen extends GetView<ExploreController> {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.03),
                    const FindProductsSection(),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    CustomSearchWidget(onChanged: controller.onSearchChanged),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Obx(
                        () => ProductCardsGrid(
                          categories: controller.filteredCategories,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBarSection(
        currentIndex: 1,
        onTabChanged: (index) {},
      ),
    );
  }
}

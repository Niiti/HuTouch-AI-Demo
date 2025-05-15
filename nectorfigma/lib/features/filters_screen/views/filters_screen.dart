import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/features/filters_screen/controllers/filters_controller.dart';
import 'package:nectorfigma/features/filters_screen/widgets/category_item.dart';
import 'package:nectorfigma/widget/custom_header.dart';
import 'package:nectorfigma/features/favorites_screen/widgets/add_to_cart_button.dart';

class FiltersScreen extends GetView<FiltersController> {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: ColorPalette.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          AppStrings.filtersTitle,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w700,
            color: ColorPalette.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          return Column(
            children: [
              Expanded(
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: ColorPalette.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenHeight * 0.033),
                      topRight: Radius.circular(screenHeight * 0.033),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomHeader(text: AppStrings.categories),
                            SizedBox(height: screenHeight * 0.01),
                            Obx(
                              () => Column(
                                children:
                                    controller.categoryOptions
                                        .map(
                                          (option) => CategoryItem(
                                            label: option.label,
                                            selected: option.isSelected.value,
                                            screenHeight: screenHeight,
                                            asset: option.assetPath,
                                            onChanged:
                                                (value) =>
                                                    option.isSelected.value =
                                                        value ?? false,
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            const CustomHeader(text: AppStrings.brand),
                            SizedBox(height: screenHeight * 0.01),
                            Obx(
                              () => Column(
                                children:
                                    controller.brandOptions
                                        .map(
                                          (option) => CategoryItem(
                                            label: option.label,
                                            selected: option.isSelected.value,
                                            screenHeight: screenHeight,
                                            asset: option.assetPath,
                                            onChanged:
                                                (value) =>
                                                    option.isSelected.value =
                                                        value ?? false,
                                          ),
                                        )
                                        .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.02,
                ),
                child: AddToCartButton(
                  text: AppStrings.applyFilter,
                  onPressed: controller.applyFilters,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AppStrings {
  static const String filtersTitle = 'Filters';
  static const String categories = 'Categories';
  static const String brand = 'Brand';
  static const String applyFilter = 'Apply Filter';
}

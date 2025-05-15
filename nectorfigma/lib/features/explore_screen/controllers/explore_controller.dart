import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/features/explore_screen/models/category_model.dart';

class ExploreController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString searchText = ''.obs;

  final RxList<CategoryModel> categories =
      <CategoryModel>[
        CategoryModel(
          title: AppStrings.categoryFresh,
          imageAsset: ImagesAsset.apple,
          backgroundColor: ColorPalette.freshBg,
          borderColor: ColorPalette.freshBorder,
        ),
        CategoryModel(
          title: AppStrings.categoryOil,
          imageAsset: ImagesAsset.ginger,
          backgroundColor: ColorPalette.oilBg,
          borderColor: ColorPalette.oilBorder,
        ),
        CategoryModel(
          title: AppStrings.categoryMeat,
          imageAsset: ImagesAsset.chicken,
          backgroundColor: ColorPalette.meatBg,
          borderColor: ColorPalette.meatBorder,
        ),
        CategoryModel(
          title: AppStrings.categoryBakery,
          imageAsset: ImagesAsset.rice,
          backgroundColor: ColorPalette.bakeryBg,
          borderColor: ColorPalette.bakeryBorder,
        ),
        CategoryModel(
          title: AppStrings.categoryDairy,
          imageAsset: ImagesAsset.eggs,
          backgroundColor: ColorPalette.dairyBg,
          borderColor: ColorPalette.dairyBorder,
        ),
        CategoryModel(
          title: AppStrings.categoryBeverages,
          imageAsset: ImagesAsset.cocacola,
          backgroundColor: ColorPalette.beveragesBg,
          borderColor: ColorPalette.beveragesBorder,
        ),
      ].obs;

  RxList<CategoryModel> get filteredCategories =>
      searchText.value.isEmpty
          ? categories
          : categories
              .where(
                (category) => category.title.toLowerCase().contains(
                  searchText.value.toLowerCase(),
                ),
              )
              .toList()
              .obs;

  void onSearchChanged(String value) {
    searchText.value = value;
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_images.dart';
import 'package:build_me_up/modules/lunch_food_selection/models/lunch_food_item.dart';
import 'package:build_me_up/modules/profile/views/profile_view.dart';

class LunchFoodController extends GetxController {
  final RxList<LunchFoodItem> _items =
      <LunchFoodItem>[
        LunchFoodItem(
          name: 'Peas',
          calories: 150,
          gramsLabel: '5 g',
          imagePath: AppImages.greenPeas,
        ),
        LunchFoodItem(
          name: 'Fish',
          calories: 250,
          imagePath: AppImages.grilledFish,
        ),
        LunchFoodItem(
          name: 'Fries',
          calories: 70,
          imagePath: AppImages.frenchFries,
        ),
        LunchFoodItem(
          name: 'Dip',
          calories: 30,
          imagePath: AppImages.garlicDip,
        ),
      ].obs;

  final RxString query = ''.obs;
  final RxBool searchVisible = false.obs;
  final TextEditingController searchController = TextEditingController();

  List<LunchFoodItem> get items {
    final q = query.value.trim().toLowerCase();
    if (q.isEmpty) return _items;
    return _items.where((e) => e.name.toLowerCase().contains(q)).toList();
  }

  int get totalCalories => _items.fold(0, (sum, e) => sum + e.totalCalories);
  int get targetCalories => 500;

  void onBack() {
    if (Get.key.currentState?.canPop() ?? false) Get.back();
  }

  void openProfile() {
    Get.to(() => const ProfileView());
  }

  void increment(LunchFoodItem item) {
    item.quantity.value++;
    _items.refresh();
  }

  void decrement(LunchFoodItem item) {
    if (item.quantity.value > 0) {
      item.quantity.value--;
      _items.refresh();
    }
  }

  void toggleSearch() {
    searchVisible.toggle();
    if (!searchVisible.value) {
      query.value = '';
      searchController.clear();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

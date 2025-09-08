// file: lib/modules/meal_capture_review/controllers/meal_capture_review_controller.dart
import 'dart:math';
import 'package:build_me_up/core/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_images.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/modules/meal_capture_review/models/food_item.dart';

class MealCaptureReviewController extends GetxController {
  final RxString mealName = 'Breakfast'.obs;
  final RxInt consumedCalories = 0.obs;
  final RxInt totalCalories = 500.obs;

  final RxString photoAsset = 'assets/images/scrambled_eggs_on_toast.png'.obs;

  final List<String> gallery = const [
    'assets/images/scrambled_eggs_on_toast.png',
    'assets/images/quesadilla_with_salsa.png',
    'assets/images/chia_seed_pudding.png',
    'assets/images/chia_seed_pudding-1.png',
    'assets/images/chia_seed_pudding_alternate.png',
  ];

  // Data / state
  final RxList<FoodItem> allItems = <FoodItem>[].obs;
  final RxList<FoodItem> filteredItems = <FoodItem>[].obs;
  final RxBool showSearch = false.obs;
  final RxString query = ''.obs;
  final RxBool isAdding = false.obs;

  // ---------- Lifecycle ----------
  @override
  void onInit() {
    super.onInit();
    allItems.assignAll(const [
      FoodItem(
        id: 'eggs',
        name: 'Scrambled Eggs',
        caloriesPerServing: 100,
        assetPath: AppImages.scrambledEggsOnToast,
      ),
      FoodItem(
        id: 'bread',
        name: 'Bread',
        caloriesPerServing: 50,
        assetPath: AppImages.slicedBread,
      ),
    ]);
    filteredItems.assignAll(allItems);

    // Recalculate calories whenever items change.
    ever<List<FoodItem>>(allItems, (_) => _recalcConsumed());
  }

  @override
  void onReady() {
    super.onReady();
    // Example of adjusting when screen is shown
    mealName.value = 'Lunch';
    photoAsset.value = AppImages.fishAndChipsWithPeas;
  }

  // ---------- Navigation / UI actions ----------
  void onBack() {
    if (Get.key.currentState?.canPop() ?? false) {
      Get.back();
    } else {
      Get.snackbar('Info', 'No previous screen available.');
    }
  }

  void openProfile() {
    // Replace with your actual route if different
    Get.toNamed(AppRoutes.profile);
  }

  void takeAnotherPhoto() {
    final rand = Random();
    final next = gallery[rand.nextInt(gallery.length)];
    photoAsset.value = next;
    Get.snackbar(AppStrings.breakfast, AppStrings.snackbarPhoto);
  }

  void toggleSearch() {
    showSearch.toggle();
    if (!showSearch.value) clearSearch();
  }

  void goNext() {
    Get.snackbar('Next', 'Proceeding to next step');
  }

  // ---------- Search ----------
  void onQueryChanged(String value) {
    query.value = value;
    final q = value.trim().toLowerCase();
    if (q.isEmpty) {
      filteredItems.assignAll(allItems);
      return;
    }
    filteredItems.assignAll(
      allItems.where((f) => f.name.toLowerCase().contains(q)),
    );
  }

  void clearSearch() {
    query.value = '';
    filteredItems.assignAll(allItems);
  }

  // ---------- Items / calories ----------
  void _recalcConsumed() {
    consumedCalories.value = allItems.fold(
      0,
      (acc, e) => acc + (e.caloriesPerServing * e.qty),
    );
  }

  void increment(String id) {
    final idx = allItems.indexWhere((e) => e.id == id);
    if (idx == -1) return;
    final item = allItems[idx];
    allItems[idx] = item.copyWith(qty: item.qty + 1);
    _recalcConsumed();
  }

  void decrement(String id) {
    final idx = allItems.indexWhere((e) => e.id == id);
    if (idx == -1) return;
    final item = allItems[idx];
    final next = (item.qty - 1).clamp(0, 999);
    allItems[idx] = item.copyWith(qty: next);
    _recalcConsumed();
  }

  // ---------- Commit selection ----------
  Future<void> addSelected() async {
    if (isAdding.value) return;

    try {
      isAdding.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 300));
      Get.snackbar(AppStrings.breakfast, AppStrings.snackbarAdded);
    } catch (_) {
      Get.snackbar(AppStrings.breakfast, AppStrings.errorGeneric);
    } finally {
      isAdding.value = false;
    }
  }
}

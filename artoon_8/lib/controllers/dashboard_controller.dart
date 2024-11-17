// lib/controllers/dashboard_controller.dart
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedCategory = 'TRENDING'.obs;

  void onBottomNavTapped(int index) {
    selectedIndex.value = index;
    // TODO: Implement navigation logic based on index
  }

  void onCategorySelected(String category) {
    selectedCategory.value = category;
    // TODO: Update content based on selected category
  }
}

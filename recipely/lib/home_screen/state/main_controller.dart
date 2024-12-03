import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:recipely/home_screen/model/recipe_model.dart';
import 'package:recipely/search_screen/features/search_feature/controllers/search_controller.dart';

class MainController extends GetxController {
final SearchController searchController = Get.put(SearchController());
  int userId = 123; 
  var selectedCategory = ''.obs;
  var categories = <String>[].obs;
  var isLoading = true.obs;
  var favoriteIndices = <int>{}.obs;
  var featuredRecipes = <RecipeModel>[].obs;


  @override
  void onInit() { 
    super.onInit();
    fetchCategories();
    fetchFeaturedRecipes();
  }

  Future<void> fetchCategories() async {
    const apiUrl = 'https://4c2210a8-b849-4b78-8998-a6d861d8825a.mock.pstmn.io/api/categories';
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        categories.value = List<String>.from(data['categories'] ?? []);
      } else {
        // Handle API response errors
        Get.snackbar('Error', 'Failed to load categories: ${response.statusCode}');
        categories.value = [];
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar('Error', 'Failed to load categories: $e');
      categories.value = [];
    } finally {
      isLoading(false);
    }
  }

  void toggleSelectedCategory(String category) {
    selectedCategory.value = category;
  }

  void toggleFavorite(int index) {
    if (favoriteIndices.contains(index)) {
      favoriteIndices.remove(index);
    } else {
      favoriteIndices.add(index);
    }
  }

  void updateFavoriteStatus(int index, bool isFavorite) {
    if (isFavorite) {
      favoriteIndices.add(index);
    } else {
      favoriteIndices.remove(index);
    }
  }

  void fetchFeaturedRecipes() async {
    try {
      isLoading(true);
      final baseUrl = 'https://4c2210a8-b849-4b78-8998-a6d861d8825a.mock.pstmn.io';
      final response = await http.get(Uri.parse('$baseUrl/api/featured'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['featured'];
        featuredRecipes.assignAll(jsonData.map((item) => RecipeModel.fromJson(item)).toList());
      } else {
        Get.snackbar('Error', 'Failed to load featured recipes.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

    void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
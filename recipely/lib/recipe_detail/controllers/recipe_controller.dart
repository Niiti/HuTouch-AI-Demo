import 'package:get/get.dart';

class RecipeController extends GetxController {
  var isFavorite = false.obs;
  var activeTab = 'Ingredients'.obs;
  var ingredientQuantities = <String, int>{
    'Tortilla Chips': 2,
    'Avocado': 1,
    'Red Cabbage': 9,
    'Peanuts': 1,
    'Red Onions': 1,
  }.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void setActiveTab(String tab) {
    activeTab.value = tab;
  }

  void addAllToCart() {
    try {
      ingredientQuantities.updateAll((key, value) => value + 1);
    } catch (e) {
      print('Error adding all to cart: $e');
    }
  }

  void updateIngredient(String ingredient, int change) {
    try {
      if (ingredientQuantities[ingredient]! + change > 0) {
        ingredientQuantities[ingredient] = ingredientQuantities[ingredient]! + change;
      }
    } catch (e) {
      print('Error updating ingredient: $e');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

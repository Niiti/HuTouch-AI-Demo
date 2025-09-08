import 'package:get/get.dart';

class LunchFoodItem {
  LunchFoodItem({
    required this.name,
    required this.calories,
    required this.imagePath,
    this.gramsLabel,
    int initialQty = 1,
  }) : quantity = initialQty.obs;

  final String name;
  final int calories;
  final String imagePath;
  final String? gramsLabel;
  final RxInt quantity;

  int get totalCalories => calories * quantity.value;
}

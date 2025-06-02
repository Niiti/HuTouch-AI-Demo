import 'package:get/get.dart';

class ShopDetailsController extends GetxController {
  var isDescriptionExpanded = false.obs;
  void toggleDescription() => isDescriptionExpanded.value = !isDescriptionExpanded.value;

  var selectedCategoryIndex = 0.obs;
  void selectCategory(int index) => selectedCategoryIndex.value = index;
}

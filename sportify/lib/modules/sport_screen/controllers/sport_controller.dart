// lib/modules/sport_screen/controllers/sport_controller.dart
import 'package:get/get.dart';
import '../../../constants/app_constants.dart';

class SportController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;

    if (index == 1) {
      Get.toNamed(AppConstants.matchFeatures);
    }
  }

  // Add additional state management and business logic here
}

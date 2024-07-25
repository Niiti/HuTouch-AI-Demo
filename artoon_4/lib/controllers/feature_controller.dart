import 'package:get/get.dart';

class FeatureController extends GetxController {
  var selectedFeature = ''.obs;

  void selectFeature(String feature) {
    selectedFeature.value = feature;
  }

  void nextStep() {
    if (selectedFeature.isEmpty) {
      Get.snackbar('Error', 'Please select a feature.');
    } else {
      // Navigate to the next screen or perform any desired action
      Get.to(NextScreen());
    }
  }
}

class NextScreen {
}

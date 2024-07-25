import 'package:get/get.dart';

class GenderController extends GetxController {
  var selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void createAvatars() {
    if (selectedGender.isEmpty) {
      Get.snackbar('Error', 'Please select a gender.');
    } else {
      // Navigate to the next screen or perform avatar creation
      Get.toNamed('/avatar_creation', arguments: selectedGender.value);
    }
  }
}


import 'package:get/get.dart';

class GenderViewModel extends GetxController {
  var selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  Future<void> createAvatar() async {
    if (selectedGender.value.isEmpty) {
      Get.snackbar('Error', 'Please select your gender before proceeding.');
      return;
    }

    try {
      await Future.delayed(Duration(seconds: 2));
      Get.snackbar('Success', 'Avatar has been created successfully for ${selectedGender.value}.');
    } catch (error) {
      // NetworkErrorHandler.handleError(error);
    }
  }
}
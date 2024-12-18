import 'package:get/get.dart';

class SignUpController extends GetxController {
  var selectedLanguage = ''.obs;
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}

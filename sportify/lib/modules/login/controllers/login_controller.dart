import 'package:get/get.dart';
import '../../../constants/app_constants.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void updateEmail(String value) {
    email.value = value;
  }

  void updatePassword(String value) {
    password.value = value;
  }

  void signIn() {
    // Implement sign in logic
  }

  void forgotPassword() {
    // Implement forgot password logic
  }

  void signUp() {
    // Implement sign up navigation
    Get.toNamed(AppConstants.profileRoute);
  }
}

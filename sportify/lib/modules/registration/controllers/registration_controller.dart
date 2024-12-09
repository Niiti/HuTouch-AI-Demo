import 'package:get/get.dart';
import '../../../constants/app_strings.dart';
import '../../../../../utils/error_handler.dart';

class RegistrationController extends GetxController {
  var isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    if (value != null) {
      isChecked.value = value;
    }
  }

  void createAccount() {
    try {
      if (!isChecked.value) {
        ErrorHandler.showErrorMessage('You must agree to the terms');
        return;
      }
      // Handle account creation logic
    } catch (e) {
      ErrorHandler.showErrorMessage(AppString.consentText);
    }
  }
}

import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var selectedPaymentMethod = ''.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void addPaymentMethod() {
    // Handle adding new payment method logic
  }
}

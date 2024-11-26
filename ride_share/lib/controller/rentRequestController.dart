import 'package:get/get.dart';

class RentRequestController extends GetxController {
  var selectedDate = ''.obs;
  var selectedTime = ''.obs;
  var paymentMethod = ''.obs;

  updateDate(String date) {
    selectedDate.value = date;
  }

  updateTime(String time) {
    selectedTime.value = time;
  }

  updatePayment(String method) {
    paymentMethod.value = method;
  }
}

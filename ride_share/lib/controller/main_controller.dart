import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedOption = 'Transport'.obs;

  void toggleOption(String option) {
    selectedOption.value = option;
  }
}

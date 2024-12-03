import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void onEngagementTap(String action) {
    // Handle engagement actions
  }

  void onSubscribe() {
    // Handle subscribe action
  }
}

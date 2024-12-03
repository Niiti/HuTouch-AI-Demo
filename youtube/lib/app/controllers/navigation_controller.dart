import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    if (index != 2) {
      currentIndex.value = index;
    }
  }

  void changePage(int index) {
    selectedIndex(index);
  }
}

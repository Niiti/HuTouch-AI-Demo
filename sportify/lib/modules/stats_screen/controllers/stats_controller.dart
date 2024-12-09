import 'package:get/get.dart';

class StatsController extends GetxController {
  final selectedTabIndex = 0.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}

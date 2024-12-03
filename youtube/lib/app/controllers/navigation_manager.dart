import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NavigationManager extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  Utils._();
  static void showSuccessSnackBar(String message) {
    Get.snackbar(
      '',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showErrorSnackBar(String message) {
    Get.snackbar(
      '',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

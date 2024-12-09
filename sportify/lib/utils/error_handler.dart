import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void showErrorMessage(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
}

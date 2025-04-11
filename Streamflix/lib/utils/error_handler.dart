import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void showErrorMessage({required String message}) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
  }
}

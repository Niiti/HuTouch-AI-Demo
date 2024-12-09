import 'package:flutter/material.dart';
import 'custom_exceptions.dart';
import 'failure_handler.dart';
import '../utils/logger.dart';

class ErrorHandler2 {
  void handleError(Object error) {
    if (error is CustomException) {
      LoggerUtil.logError(error.message);
      // Handle specific custom exception
    } else {
      LoggerUtil.logError(error.toString());
      // Handle generic error
    }
  }
}

// lib/core/error/global_error_handler.dart
import 'package:flutter/material.dart';
import 'failures.dart';
import '../utils/application_logger.dart';
import '../utils/logger.dart';
import './error_handler.dart';

void handleFailure(Failure failure, BuildContext context) {
  ApplicationLogger.log(failure.message);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(failure.message)),
  );
}

void setupGlobalErrorHandler() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    LoggerUtil.logError(details.exceptionAsString());
    // You can add more sophisticated error handling here
  };
}

// Rename the instance to avoid conflict with the class name
class GlobalErrorManager2 {
  final ErrorHandler2
      errorHandler; // Renamed from ErrorHandler2 to errorHandler

  GlobalErrorManager2(this.errorHandler);

  void handle(Object error) {
    errorHandler.handleError(error); // Updated to use the renamed instance
  }
}

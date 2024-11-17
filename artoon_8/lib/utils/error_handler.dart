// lib/utils/error_handler.dart
// Error handling utilities

import '../models/error_model.dart';

class ErrorHandler {
  static ErrorModel handle(Exception exception) {
    // Implement error handling logic
    return ErrorModel(message: exception.toString());
  }
}

import 'package:logger/logger.dart';
import './logger.dart';

class ApplicationLogger {
  static final Logger _logger = Logger();

  static void log(String? message) {
    _logger.i(message ?? 'No message provided');
  }

  static void error(String? message) {
    _logger.e(message ?? 'An unknown error occurred');
  }
}

class ApplicationLogger2 {
  void log(String message) {
    LoggerUtil.logInfo(message);
  }

  void logError(String message) {
    LoggerUtil.logError(message);
  }
}
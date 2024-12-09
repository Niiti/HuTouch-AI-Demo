import 'package:logger/logger.dart';

class LoggerUtil {
  static final Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  LoggerUtil._();

  static void logInfo(String message) {
    logger.i(message);
  }

  static void logError(String message) {
    logger.e(message);
  }

  static void logDebug(String message) {
    logger.d(message);
  }
}
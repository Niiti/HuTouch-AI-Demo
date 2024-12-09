// lib/core/error/server_exception.dart
import './custom_exceptions.dart';

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class ServerException2 extends CustomException {
  ServerException2(String message) : super(message);
}

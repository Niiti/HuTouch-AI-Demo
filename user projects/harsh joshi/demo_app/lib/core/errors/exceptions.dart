// lib/core/errors/exceptions.dart
class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server Exception']);
}

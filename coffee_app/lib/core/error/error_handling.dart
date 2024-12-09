import 'package:dartz/dartz.dart';
import './exceptions.dart';
import '../utils/logger.dart';
import './failures.dart';
import './custom_exceptions.dart';
class Failure {
  final String message;

  Failure(this.message);
}

Future<Either<Failure, T>> handleError<T>(
    Future<Either<Failure, T>> Function() action) async {
  try {
    return await action();
  } on ServerException {
    return Left(Failure('Server Error'));
  } on CacheException {
    return Left(Failure('Cache Error'));
  } catch (e) {
    return Left(Failure('Unexpected Error'));
  }
}

class NotFoundException extends ServerException {}

class UnauthorizedException extends ServerException {}

class ErrorHandler {
  static handleError(Object error) {
    if (error is ServerException_1) {
      LoggerUtil.logError('ServerException: ${error.message}');
      return ServerException_1(error.message);
    } else {
      LoggerUtil.logError('Unknown Exception: $error');
      return UnknownFailure();
    }
  }
}

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


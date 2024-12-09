abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}


class NotFoundFailure extends Failure {
  NotFoundFailure() : super('Not Found');
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure() : super('Unauthorized');
}


class UnknownFailure extends Failure {
  UnknownFailure() : super('An unknown error occurred.');
}

// Add more failures as needed

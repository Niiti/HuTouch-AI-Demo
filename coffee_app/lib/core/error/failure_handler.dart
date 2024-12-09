abstract class Failure {}

class ServerFailure2 extends Failure {
  final String message;
  ServerFailure2(this.message);
}

class CacheFailure2 extends Failure {
  final String message;
  CacheFailure2(this.message);
}

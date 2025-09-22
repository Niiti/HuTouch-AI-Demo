import 'exceptions.dart';

abstract class Failure {
  final String msg;
  final String? errorApi;

  Failure({required this.msg, this.errorApi});
}

class ServerFailure extends Failure {
  ServerFailure({required super.msg, super.errorApi});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.msg, super.errorApi});
}

class TimeoutFailure extends Failure {
  TimeoutFailure({required super.msg, super.errorApi});
}

class BadRequestFailure extends Failure {
  BadRequestFailure({required super.msg, super.errorApi});
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.msg, super.errorApi});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required super.msg, super.errorApi});
}

class LocalFailure extends Failure {
  LocalFailure({required super.msg, super.errorApi});
}

Failure mapExceptionToFailure(Exception e, {String? errorApi}) {
  if (e is NetworkException) {
    return NetworkFailure(msg: "Revise su conexión a internet", errorApi: errorApi);
  } else if (e is TimeoutException) {
    return TimeoutFailure(msg: "Tiempo de espera agotado.", errorApi: errorApi);
  } else if (e is BadRequestException) {
    return BadRequestFailure(msg: "Solicitud incorrecta", errorApi: errorApi);
  } else if (e is UnauthorizedException) {
    return UnauthorizedFailure(msg: "Acceso no autorizado", errorApi: errorApi);
  } else if (e is NotFoundException) {
    return NotFoundFailure(msg: "Solicitud no encontrada", errorApi: errorApi);
  } else {
    return ServerFailure(msg: "Servicio no disponible, intente mas tarde", errorApi: errorApi);
  }
}



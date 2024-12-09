import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handling.dart';
import '../entities/coffee.dart';

abstract class CoffeeRepository {
  Future<Either<Failure, List<Coffee>>> getCoffees();
}
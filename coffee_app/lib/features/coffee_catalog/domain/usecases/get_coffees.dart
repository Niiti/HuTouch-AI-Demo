import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handling.dart';
import '../entities/coffee.dart';
import '../repositories/coffee_repository.dart';

class GetCoffees {
  final CoffeeRepository repository;

  GetCoffees(this.repository);

  Future<Either<Failure, List<Coffee>>> call() async {
    return await repository.getCoffees();
  }
}
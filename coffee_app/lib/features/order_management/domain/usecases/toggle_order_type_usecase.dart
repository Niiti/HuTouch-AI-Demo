import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/order_repository.dart';

class ToggleOrderTypeUseCase {
  final OrderRepository repository;

  ToggleOrderTypeUseCase(this.repository);

  Future<Either<Failure, bool>> execute(bool isDeliver) async {
    // Implement the use case logic, possibly updating order type in repository
    // For simplicity, return Right with the toggled value
    return Right(isDeliver);
  }
}

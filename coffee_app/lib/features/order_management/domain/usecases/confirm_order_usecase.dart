import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/order_repository.dart';
import '../entities/order_entity.dart';

class ConfirmOrderUseCase {
  final OrderRepository repository;

  ConfirmOrderUseCase(this.repository);

  Future<Either<Failure, OrderEntity>> execute(OrderEntity order) async {
    return await repository.createOrder(order);
  }
}

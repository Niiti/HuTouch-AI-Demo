import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders(); // Add this method
  Future<Either<Failure, OrderEntity>> createOrder(OrderEntity order);
}

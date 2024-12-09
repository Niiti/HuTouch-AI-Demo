import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      // Assuming the remote data source has a method to fetch orders
      final orders = await remoteDataSource.getOrders(); // Implement this in the remote data source
      return Right(orders.map((model) => model as OrderEntity).toList());
    } on ServerException_1 catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> createOrder(OrderEntity order) async {
    try {
      final orderModel = await remoteDataSource.createOrder(order as dynamic);
      return Right(orderModel);
    } on ServerException_1 catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error'));
    }
  }
}

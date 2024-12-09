// lib/features/product_detail/data/repositories/product_repository_impl.dart
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_service.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_exception.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteService remoteService;

  ProductRepositoryImpl({required this.remoteService});

  @override
  Future<Either<Failure, ProductEntity>> getProductDetail() async {
    try {
      final productModel = await remoteService.fetchProductDetail();
      return Right(productModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected Error'));
    }
  }
}
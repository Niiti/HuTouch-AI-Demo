// lib/features/product_detail/domain/repositories/product_repository.dart
import '../entities/product_entity.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductEntity>> getProductDetail();
}
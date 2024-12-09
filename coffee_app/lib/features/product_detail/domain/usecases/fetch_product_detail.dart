// lib/features/product_detail/domain/usecases/fetch_product_detail.dart
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

class FetchProductDetail {
  final ProductRepository repository;

  FetchProductDetail(this.repository);

  Future<Either<Failure, ProductEntity>> call() async {
    return await repository.getProductDetail();
  }
}
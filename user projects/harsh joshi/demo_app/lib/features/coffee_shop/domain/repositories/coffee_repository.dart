// lib/features/coffee_shop/domain/repositories/coffee_repository.dart
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../entities/coffee_product.dart';

abstract class CoffeeRepository {
  Future<Result<Failure, List<CoffeeProduct>>> getProducts();
}

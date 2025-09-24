// lib/features/coffee_shop/domain/usecases/get_coffee_products.dart
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../entities/coffee_product.dart';
import '../repositories/coffee_repository.dart';

class GetCoffeeProducts {
  final CoffeeRepository repository;
  GetCoffeeProducts(this.repository);

  Future<Result<Failure, List<CoffeeProduct>>> call() async {
    return repository.getProducts();
  }
}

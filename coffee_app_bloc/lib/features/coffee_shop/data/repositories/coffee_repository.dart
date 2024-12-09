// lib/features/coffee_shop/data/repositories/coffee_repository.dart
import '../../domain/blocs/coffee_bloc.dart';
import '../models/coffee_product_model.dart';
import '../datasources/coffee_remote_data_source.dart';

abstract class CoffeeRepository {
  Future<List<CoffeeProductModel>> getProducts();
}

class CoffeeRepositoryImpl implements CoffeeRepository {
  final CoffeeRemoteDataSource remoteDataSource;

  CoffeeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CoffeeProductModel>> getProducts() async {
    return await remoteDataSource.fetchProducts();
  }
}

// lib/features/coffee_shop/data/repositories/coffee_repository_impl.dart
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/coffee_product.dart';
import '../../domain/repositories/coffee_repository.dart';
import '../datasources/coffee_remote_data_source.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final CoffeeRemoteDataSource remoteDataSource;
  CoffeeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<Failure, List<CoffeeProduct>>> getProducts() async {
    try {
      final models = await remoteDataSource.fetchProducts();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }
}

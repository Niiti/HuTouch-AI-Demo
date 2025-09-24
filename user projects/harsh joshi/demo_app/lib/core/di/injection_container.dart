// lib/core/di/injection_container.dart
import 'package:get_it/get_it.dart';

import '../../features/coffee_shop/data/datasources/coffee_remote_data_source.dart';
import '../../features/coffee_shop/data/repositories/coffee_repository_impl.dart';
import '../../features/coffee_shop/domain/repositories/coffee_repository.dart';
import '../../features/coffee_shop/domain/usecases/get_coffee_products.dart';
import '../../features/coffee_shop/presentation/bloc/coffee_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  // Data sources
  sl.registerLazySingleton<CoffeeRemoteDataSource>(() => CoffeeRemoteDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<CoffeeRepository>(() => CoffeeRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton<GetCoffeeProducts>(() => GetCoffeeProducts(sl()));

  // Blocs
  sl.registerFactory<CoffeeBloc>(() => CoffeeBloc(getCoffeeProducts: sl()));
}

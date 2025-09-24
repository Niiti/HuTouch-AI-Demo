import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipley_app/modules/home/data/datasources/home_local_data_source.dart';
import 'package:recipley_app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:recipley_app/modules/home/domain/repositories/home_repository.dart';
import 'package:recipley_app/modules/home/domain/usecases/get_categories.dart';
import 'package:recipley_app/modules/home/domain/usecases/get_featured_recipes.dart';
import 'package:recipley_app/modules/home/domain/usecases/get_popular_by_category.dart';

final homeLocalDataSourceProvider = Provider<HomeLocalDataSource>((ref) => HomeLocalDataSource());

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(ref.read(homeLocalDataSourceProvider)),
);

final getCategoriesProvider = Provider<GetCategories>((ref) => GetCategories(ref.read(homeRepositoryProvider)));
final getFeaturedProvider  = Provider<GetFeaturedRecipes>((ref) => GetFeaturedRecipes(ref.read(homeRepositoryProvider)));
final getPopularByCategoryProvider =
    Provider<GetPopularByCategory>((ref) => GetPopularByCategory(ref.read(homeRepositoryProvider)));

import 'package:recipley_app/core/result.dart';
import 'package:recipley_app/modules/home/data/datasources/home_local_data_source.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';
import 'package:recipley_app/modules/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _local;
  HomeRepositoryImpl(this._local);

  @override
  Future<Result<List<Category>>> getCategories() async {
    try {
      return Ok(_local.getCategories());
    } catch (_) {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<List<Recipe>>> getFeatured() async {
    try {
      return Ok(_local.getFeatured());
    } catch (_) {
      return const Err(UnknownFailure());
    }
  }

  @override
  Future<Result<List<Recipe>>> getPopularByCategory(CategoryId id) async {
    try {
      final items = _local.getPopular().where((e) => e.category == id).toList();
      return Ok(items);
    } catch (_) {
      return const Err(UnknownFailure());
    }
  }
}

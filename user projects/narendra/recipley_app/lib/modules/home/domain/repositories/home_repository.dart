import 'package:recipley_app/core/result.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';

abstract class HomeRepository {
  Future<Result<List<Recipe>>> getFeatured();
  Future<Result<List<Recipe>>> getPopularByCategory(CategoryId id);
  Future<Result<List<Category>>> getCategories();
}

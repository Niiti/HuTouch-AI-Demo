import 'package:recipley_app/core/result.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';
import 'package:recipley_app/modules/home/domain/repositories/home_repository.dart';

class GetPopularByCategory {
  final HomeRepository _repo;
  GetPopularByCategory(this._repo);

  Future<Result<List<Recipe>>> call(CategoryId id) => _repo.getPopularByCategory(id);
}

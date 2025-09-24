import 'package:recipley_app/core/result.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';
import 'package:recipley_app/modules/home/domain/repositories/home_repository.dart';

class GetFeaturedRecipes {
  final HomeRepository _repo;
  GetFeaturedRecipes(this._repo);

  Future<Result<List<Recipe>>> call() => _repo.getFeatured();
}

import 'package:recipley_app/core/result.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/modules/home/domain/repositories/home_repository.dart';

class GetCategories {
  final HomeRepository _repo;
  GetCategories(this._repo);

  Future<Result<List<Category>>> call() => _repo.getCategories();
}

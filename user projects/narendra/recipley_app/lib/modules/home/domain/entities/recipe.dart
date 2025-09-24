import 'package:freezed_annotation/freezed_annotation.dart';
part 'recipe.freezed.dart';

@freezed
sealed class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String title,
    required String image,
    required String authorName,
    required String authorImage,
    required int minutes,
    required int calories,
    required String category,
  }) = _Recipe;
}
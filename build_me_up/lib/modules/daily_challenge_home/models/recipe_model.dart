// file: lib/modules/daily_challenge_home/models/recipe_model.dart
class RecipeModel {
  final String title;
  final int calories;

  /// Asset path or network URL.
  final String image;

  const RecipeModel({
    required this.title,
    required this.calories,
    required this.image,
  });
}

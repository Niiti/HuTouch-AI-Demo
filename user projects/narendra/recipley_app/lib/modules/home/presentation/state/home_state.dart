import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/modules/home/domain/entities/recipe.dart';
part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Category> categories,
    @Default(0) int selectedCategoryIndex,
    @Default([]) List<Recipe> featured,
    @Default([]) List<Recipe> popular,
    @Default(false) bool loading,
    String? error,
  }) = _HomeState;
}

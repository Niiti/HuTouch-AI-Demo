import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipley_app/core/result.dart';
import 'package:recipley_app/modules/home/data/providers/home_providers.dart';
import 'package:recipley_app/modules/home/domain/entities/category.dart';
import 'package:recipley_app/modules/home/presentation/state/home_state.dart';

class HomeViewModel extends Notifier<HomeState> {
  late final _getCategories = ref.read(getCategoriesProvider);
  late final _getFeatured = ref.read(getFeaturedProvider);
  late final _getPopularByCategory = ref.read(getPopularByCategoryProvider);

  @override
  HomeState build() {
    _bootstrap();
    return const HomeState(loading: true);
  }

  Future<void> _bootstrap() async {
    final catsRes = await _getCategories();
    state = catsRes.when(
      ok: (cats) => state.copyWith(categories: cats, selectedCategoryIndex: 0, error: null),
      err: (f) => state.copyWith(error: f.message),
    );

    final featRes = await _getFeatured();
    state = featRes.when(
      ok: (recipes) => state.copyWith(featured: recipes, error: null),
      err: (f) => state.copyWith(error: f.message),
    );

    await _loadPopularForSelected();
    state = state.copyWith(loading: false);
  }

  Future<void> _loadPopularForSelected() async {
    final cats = state.categories;
    if (cats.isEmpty) return;
    final CategoryId id = cats[state.selectedCategoryIndex].id;
    final res = await _getPopularByCategory(id);
    state = res.when(
      ok: (list) => state.copyWith(popular: list, error: null),
      err: (f) => state.copyWith(error: f.message),
    );
  }

  void selectCategory(int index) {
    if (index < 0 || index >= state.categories.length) return;
    state = state.copyWith(selectedCategoryIndex: index, loading: true);
    _loadPopularForSelected().whenComplete(() => state = state.copyWith(loading: false));
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(HomeViewModel.new);

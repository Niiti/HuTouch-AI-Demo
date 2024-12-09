library coffee_bloc;

import 'package:equatable/equatable.dart';
import '../../data/models/coffee_product_model.dart';
import '../../data/repositories/coffee_repository.dart';
import 'package:bloc/bloc.dart';

part '../events/coffee_event.dart';
part '../states/coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final CoffeeRepository repository;

  List<CoffeeProductModel> _allProducts = [];
  String _selectedCategory = 'All Coffee';
  String _searchQuery = '';

  CoffeeBloc(this.repository) : super(CoffeeInitial()) {
    on<LoadCoffeeProducts>(_onLoadCoffeeProducts);
    on<SelectCategory>(_onSelectCategory);
    on<SearchCoffeeProducts>(_onSearchCoffeeProducts);
  }

  // Expose the selected category via a public getter
  String get selectedCategory => _selectedCategory;

  void _onLoadCoffeeProducts(
      LoadCoffeeProducts event, Emitter<CoffeeState> emit) async {
    emit(CoffeeLoading());
    try {
      final products = await repository.getProducts();
      _allProducts = products;
      emit(CoffeeLoaded(_filterProducts()));
    } catch (e) {
      emit(CoffeeError(e.toString()));
    }
  }

  void _onSelectCategory(
      SelectCategory event, Emitter<CoffeeState> emit) {
    _selectedCategory = event.category;
    emit(CoffeeLoaded(_filterProducts()));
  }

  void _onSearchCoffeeProducts(
      SearchCoffeeProducts event, Emitter<CoffeeState> emit) {
    _searchQuery = event.query.toLowerCase();
    emit(CoffeeLoaded(_filterProducts()));
  }

  List<CoffeeProductModel> _filterProducts() {
    List<CoffeeProductModel> filtered = _allProducts;

    if (_selectedCategory != 'All Coffee') {
      filtered = filtered.where((p) => p.category == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((p) =>
          p.title.toLowerCase().contains(_searchQuery) ||
          p.subtitle.toLowerCase().contains(_searchQuery)).toList();
    }

    return filtered;
  }
}

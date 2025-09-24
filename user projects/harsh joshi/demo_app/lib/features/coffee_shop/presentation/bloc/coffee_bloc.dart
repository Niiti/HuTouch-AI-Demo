// lib/features/coffee_shop/presentation/bloc/coffee_bloc.dart
library coffee_bloc;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/coffee_product.dart';
import '../../domain/usecases/get_coffee_products.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final GetCoffeeProducts getCoffeeProducts;

  List<CoffeeProduct> _allProducts = [];
  String _selectedCategory = 'All Coffee';
  String _searchQuery = '';

  CoffeeBloc({required this.getCoffeeProducts}) : super(CoffeeInitial()) {
    on<LoadCoffeeProducts>(_onLoadCoffeeProducts);
    on<SelectCategory>(_onSelectCategory);
    on<SearchCoffeeProducts>(_onSearch);
  }

  String get selectedCategory => _selectedCategory;

  Future<void> _onLoadCoffeeProducts(
    LoadCoffeeProducts event,
    Emitter<CoffeeState> emit,
  ) async {
    emit(CoffeeLoading());
    final Result<Failure, List<CoffeeProduct>> result =
        await getCoffeeProducts();

    result.fold(
      (failure) => emit(CoffeeError(failure.message)),
      (products) {
        _allProducts = products;
        emit(CoffeeLoaded(_filter()));
      },
    );
  }

  void _onSelectCategory(SelectCategory event, Emitter<CoffeeState> emit) {
    _selectedCategory = event.category;
    emit(CoffeeLoaded(_filter()));
  }

  void _onSearch(SearchCoffeeProducts event, Emitter<CoffeeState> emit) {
    _searchQuery = event.query.toLowerCase();
    emit(CoffeeLoaded(_filter()));
  }

  List<CoffeeProduct> _filter() {
    var filtered = _allProducts;

    if (_selectedCategory != 'All Coffee') {
      filtered = filtered.where((p) => p.category == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((p) =>
              p.title.toLowerCase().contains(_searchQuery) ||
              p.subtitle.toLowerCase().contains(_searchQuery))
          .toList();
    }

    return filtered;
  }
}

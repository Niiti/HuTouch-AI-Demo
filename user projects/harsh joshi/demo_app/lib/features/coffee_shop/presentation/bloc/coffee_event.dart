// lib/features/coffee_shop/presentation/bloc/coffee_event.dart
part of coffee_bloc;

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();
  @override
  List<Object?> get props => [];
}

class LoadCoffeeProducts extends CoffeeEvent {}

class SelectCategory extends CoffeeEvent {
  final String category;
  const SelectCategory(this.category);
  @override
  List<Object?> get props => [category];
}

class SearchCoffeeProducts extends CoffeeEvent {
  final String query;
  const SearchCoffeeProducts(this.query);
  @override
  List<Object?> get props => [query];
}

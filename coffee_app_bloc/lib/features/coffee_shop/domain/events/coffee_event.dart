part of coffee_bloc;

abstract class CoffeeEvent extends Equatable {
  const CoffeeEvent();

  @override
  List<Object> get props => [];
}

class LoadCoffeeProducts extends CoffeeEvent {}

class SelectCategory extends CoffeeEvent {
  final String category;

  SelectCategory(this.category);

  @override
  List<Object> get props => [category];
}

class SearchCoffeeProducts extends CoffeeEvent {
  final String query;

  SearchCoffeeProducts(this.query);

  @override
  List<Object> get props => [query];
}

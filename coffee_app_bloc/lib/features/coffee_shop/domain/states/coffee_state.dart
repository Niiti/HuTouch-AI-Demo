// lib/features/coffee_shop/domain/states/coffee_state.dart
part of coffee_bloc;

abstract class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object> get props => [];
}

class CoffeeInitial extends CoffeeState {}

class CoffeeLoading extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  final List<CoffeeProductModel> products;

  const CoffeeLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class CoffeeError extends CoffeeState {
  final String message;

  const CoffeeError(this.message);

  @override
  List<Object> get props => [message];
}

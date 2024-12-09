part of 'coffee_bloc.dart';

abstract class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object> get props => [];
}

class CoffeeInitial extends CoffeeState {}

class CoffeeLoading extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  final List<Coffee> coffees;
  final int cartCount;

  CoffeeLoaded({required this.coffees, this.cartCount = 0});

  CoffeeLoaded copyWith({List<Coffee>? coffees, int? cartCount}) {
    return CoffeeLoaded(
      coffees: coffees ?? this.coffees,
      cartCount: cartCount ?? this.cartCount,
    );
  }

  @override
  List<Object> get props => [coffees, cartCount];
}

class CoffeeError extends CoffeeState {
  final String message;

  CoffeeError({required this.message});

  @override
  List<Object> get props => [message];
}
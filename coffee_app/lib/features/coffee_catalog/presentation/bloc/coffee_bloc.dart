import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/coffee.dart';
import '../../domain/usecases/get_coffees.dart';
import '../../../../core/error/error_handling.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends HydratedBloc<CoffeeEvent, CoffeeState> {
  final GetCoffees getCoffees;

  CoffeeBloc({required this.getCoffees}) : super(CoffeeInitial()) {
    on<LoadCoffeesEvent>(_onLoadCoffees);
    on<AddToCartEvent>(_onAddToCart);
  }

  void _onLoadCoffees(LoadCoffeesEvent event, Emitter<CoffeeState> emit) async {
    emit(CoffeeLoading());
    final result = await getCoffees();
    result.fold(
      (failure) => emit(CoffeeError(message: failure.message)),
      (coffees) => emit(CoffeeLoaded(coffees: coffees)),
    );
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CoffeeState> emit) {
    if (state is CoffeeLoaded) {
      final currentState = state as CoffeeLoaded;
      emit(currentState.copyWith(cartCount: currentState.cartCount + 1));
    }
  }

  @override
  CoffeeState? fromJson(Map<String, dynamic> json) {
    try {
      return CoffeeLoaded(
        coffees: (json['coffees'] as List)
            .map((coffee) => Coffee(
                  image: coffee['image'],
                  name: coffee['name'],
                  description: coffee['description'],
                  price: (coffee['price'] as num).toDouble(),
                  rating: (coffee['rating'] as num).toDouble(),
                  category: coffee['category'],
                ))
            .toList(),
        cartCount: json['cartCount'] ?? 0,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(CoffeeState state) {
    if (state is CoffeeLoaded) {
      return {
        'coffees': state.coffees
            .map((coffee) => {
                  'image': coffee.image,
                  'name': coffee.name,
                  'description': coffee.description,
                  'price': coffee.price,
                  'rating': coffee.rating,
                  'category': coffee.category,
                })
            .toList(),
        'cartCount': state.cartCount,
      };
    }
    return null;
  }
}
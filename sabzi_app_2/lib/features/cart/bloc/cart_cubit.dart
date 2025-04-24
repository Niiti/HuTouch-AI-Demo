import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/features/cart/models/cart_item.dart';

abstract class CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;
  CartLoaded({required this.cartItems});
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoading());

  Future<void> loadCartItems({
    required Future<List<CartItem>> Function() fetchItems,
  }) async {
    emit(CartLoading());
    try {
      final items = await fetchItems();
      emit(CartLoaded(cartItems: items));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  void updateQuantity(int index, int change) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      try {
        final updatedItems = List<CartItem>.from(currentState.cartItems);
        updatedItems[index].quantity += change;
        if (updatedItems[index].quantity < 1) {
          updatedItems[index].quantity = 1;
        }
        emit(CartLoaded(cartItems: updatedItems));
      } catch (e) {
        emit(CartError(message: e.toString()));
      }
    }
  }

  void removeItem(int index) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      try {
        final updatedItems = List<CartItem>.from(currentState.cartItems);
        updatedItems.removeAt(index);
        emit(CartLoaded(cartItems: updatedItems));
      } catch (e) {
        emit(CartError(message: e.toString()));
      }
    }
  }
}

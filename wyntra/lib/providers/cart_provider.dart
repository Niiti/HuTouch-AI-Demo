import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/cart_repository.dart';
import '../models/cart_item.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(CartRepository()),
);

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier(this._repository) : super(_repository.getCartItems());

  final CartRepository _repository;

  void removeCartItem(int index) {
    state = [
      ...state.sublist(0, index),
      ...state.sublist(index + 1),
    ];
  }

  void updateQuantity(int index, int quantity) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          CartItem(
            image: state[i].image,
            name: state[i].name,
            price: state[i].price,
            quantity: quantity,
          )
        else
          state[i],
    ];
  }
}
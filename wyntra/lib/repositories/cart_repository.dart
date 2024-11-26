import '../models/cart_item.dart';

class CartRepository {
  List<CartItem> getCartItems() {
    return [
      CartItem(
        image: 'assets/unsplash_xPJYL0l5Ii8.png',
        name: 'Printed Yellow Kurta For Women',
        price: 69.69,
      ),
      CartItem(
        image: 'assets/tshirtimage1.png',
        name: 'Brown Leather Jacket For Women',
        price: 69.69,
      ),
    ];
  }
}
class CartItem {
  final String image;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
class CartItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  int quantity;
  
  CartItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
  });
}
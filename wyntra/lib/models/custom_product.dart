class CustomProduct {
  final String category;
  final String name;
  final double price;
  final double originalPrice;
  final int discount;
  final double rating;
  final int reviews;
  final String description;
  final List<String> images;
  final List<String> sizes;

  CustomProduct({
    required this.category,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.images,
    required this.sizes,
  });
}
class Product {
  final String image;
  final String name;
  final String description;
  final String price;
  final String oldPrice;
  final String discount;
  final String ratingCount;
  final double rating;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.ratingCount,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      oldPrice: json['oldPrice'] ?? '',
      discount: json['discount'] ?? '',
      ratingCount: json['ratingCount'] ?? '0',
      rating: (json['rating'] != null) ? json['rating'].toDouble() : 0.0,
    );
  }
}
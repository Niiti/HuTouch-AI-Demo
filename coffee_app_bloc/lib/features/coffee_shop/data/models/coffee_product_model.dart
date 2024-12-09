class CoffeeProductModel {
  final String imageUrl;
  final String rating;
  final String title;
  final String subtitle;
  final String price;
  final String category; // NEW FIELD

  CoffeeProductModel({
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.category, // NEW FIELD
  });

  factory CoffeeProductModel.fromJson(Map<String, dynamic> json) {
    return CoffeeProductModel(
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
      category: json['category'], // NEW FIELD
    );
  }
}

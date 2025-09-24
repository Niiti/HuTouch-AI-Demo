// lib/features/coffee_shop/data/models/coffee_product_model.dart
import '../../domain/entities/coffee_product.dart';

class CoffeeProductModel {
  final String imageUrl;
  final String rating;
  final String title;
  final String subtitle;
  final String price;
  final String category;

  CoffeeProductModel({
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.category,
  });

  factory CoffeeProductModel.fromJson(Map<String, dynamic> json) {
    return CoffeeProductModel(
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
      category: json['category'],
    );
  }

  CoffeeProduct toEntity() => CoffeeProduct(
        imageUrl: imageUrl,
        rating: rating,
        title: title,
        subtitle: subtitle,
        price: price,
        category: category,
      );
}

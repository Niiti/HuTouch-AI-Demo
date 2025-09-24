// lib/features/coffee_shop/domain/entities/coffee_product.dart
import 'package:equatable/equatable.dart';

class CoffeeProduct extends Equatable {
  final String imageUrl;
  final String rating;
  final String title;
  final String subtitle;
  final String price;
  final String category;

  const CoffeeProduct({
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.category,
  });

  @override
  List<Object?> get props => [imageUrl, rating, title, subtitle, price, category];
}

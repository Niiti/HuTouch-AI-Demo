// lib/features/product_detail/domain/entities/product_entity.dart
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final int reviewCount;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });

  @override
  List<Object> get props => [id, name, description, imageUrl, price, rating, reviewCount];
}
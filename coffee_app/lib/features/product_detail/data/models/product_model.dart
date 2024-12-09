// lib/features/product_detail/data/models/product_model.dart
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required double price,
    required double rating,
    required int reviewCount,
  }) : super(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          price: price,
          rating: rating,
          reviewCount: reviewCount,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['review_count'],
    );
  }
}
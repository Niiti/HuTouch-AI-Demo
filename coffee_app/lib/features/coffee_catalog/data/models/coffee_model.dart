import '../../domain/entities/coffee.dart';

class CoffeeModel extends Coffee {
  CoffeeModel({
    required String image,
    required String name,
    required String description,
    required double price,
    required double rating,
    required String category,
  }) : super(
          image: image,
          name: name,
          description: description,
          price: price,
          rating: rating,
          category: category,
        );

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'price': price,
      'rating': rating,
      'category': category,
    };
  }
}
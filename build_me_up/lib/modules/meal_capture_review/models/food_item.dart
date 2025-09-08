import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  final String id;
  final String name;
  final int caloriesPerServing;
  final String assetPath;
  final int qty;

  const FoodItem({
    required this.id,
    required this.name,
    required this.caloriesPerServing,
    required this.assetPath,
    this.qty = 0,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    int? caloriesPerServing,
    String? assetPath,
    int? qty,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      caloriesPerServing: caloriesPerServing ?? this.caloriesPerServing,
      assetPath: assetPath ?? this.assetPath,
      qty: qty ?? this.qty,
    );
  }

  @override
  List<Object?> get props => [id, name, caloriesPerServing, assetPath, qty];
}
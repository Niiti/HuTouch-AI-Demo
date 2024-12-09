import '../../domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required bool isDeliver,
    required int quantity,
    required String address,
    required String note,
    required double price,
    required double deliveryFee,
  }) : super(
          isDeliver: isDeliver,
          quantity: quantity,
          address: address,
          note: note,
          price: price,
          deliveryFee: deliveryFee,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      isDeliver: json['isDeliver'],
      quantity: json['quantity'],
      address: json['address'],
      note: json['note'],
      price: json['price'].toDouble(),
      deliveryFee: json['deliveryFee'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isDeliver': isDeliver,
      'quantity': quantity,
      'address': address,
      'note': note,
      'price': price,
      'deliveryFee': deliveryFee,
    };
  }
}

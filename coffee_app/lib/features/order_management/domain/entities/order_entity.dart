import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final bool isDeliver;
  final int quantity;
  final String address;
  final String note;
  final double price;
  final double deliveryFee;

  OrderEntity({
    required this.isDeliver,
    required this.quantity,
    required this.address,
    required this.note,
    required this.price,
    required this.deliveryFee,
  });

  @override
  List<Object?> get props => [isDeliver, quantity, address, note, price, deliveryFee];
}

part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class ToggleOrderTypeEvent extends OrderEvent {
  final bool isDeliver;

  const ToggleOrderTypeEvent({required this.isDeliver});

  @override
  List<Object?> get props => [isDeliver];
}

class EditAddressEvent extends OrderEvent {
  final String newAddress;

  const EditAddressEvent({required this.newAddress});

  @override
  List<Object?> get props => [newAddress];
}

class AddNoteEvent extends OrderEvent {
  final String note;

  const AddNoteEvent({required this.note});

  @override
  List<Object?> get props => [note];
}

class ChangeQuantityEvent extends OrderEvent {
  final int currentQuantity;
  final bool increase;

  const ChangeQuantityEvent({required this.currentQuantity, required this.increase});

  @override
  List<Object?> get props => [currentQuantity, increase];
}

class ShowDiscountDetailsEvent extends OrderEvent {
  const ShowDiscountDetailsEvent();

  @override
  List<Object?> get props => [];
}

class ConfirmOrderEvent extends OrderEvent {
  final bool isDeliver;
  final int quantity;
  final String address;
  final String note;
  final double price;
  final double deliveryFee;

  const ConfirmOrderEvent({
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
class FetchOrdersEvent extends OrderEvent {
  const FetchOrdersEvent();
  @override
  List<Object?> get props => [];
}

class CreateOrderEvent extends OrderEvent {
  final OrderEntity order;
  const CreateOrderEvent({required this.order});
  @override
  List<Object?> get props => [order];
}


part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderError extends OrderState {
  final String message;

  const OrderError({required this.message});

  @override
  List<Object?> get props => [message];
}

class OrderOrderTypeToggled extends OrderState {
  final bool isDeliver;

  const OrderOrderTypeToggled({required this.isDeliver});

  @override
  List<Object?> get props => [isDeliver];
}

class OrderAddressEdited extends OrderState {
  final String address;

  const OrderAddressEdited({required this.address});

  @override
  List<Object?> get props => [address];
}

class OrderNoteAdded extends OrderState {
  final String note;

  const OrderNoteAdded({required this.note});

  @override
  List<Object?> get props => [note];
}

class OrderQuantityChanged extends OrderState {
  final int quantity;

  const OrderQuantityChanged({required this.quantity});

  @override
  List<Object?> get props => [quantity];
}

class OrderDiscountDetailsShown extends OrderState {
  final String details;

  const OrderDiscountDetailsShown({required this.details});

  @override
  List<Object?> get props => [details];
}

class OrderOrderConfirmed extends OrderState {
  final OrderEntity order;

  const OrderOrderConfirmed({required this.order});

  @override
  List<Object?> get props => [order];
}

class OrderLoaded extends OrderState {
  final List<OrderEntity> orders;
  const OrderLoaded({required this.orders});
  @override
  List<Object?> get props => [orders];
}

class OrderCreated extends OrderState {
  final OrderEntity order;
  const OrderCreated({required this.order});
  @override
  List<Object?> get props => [order];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository}) : super(OrderInitial()) {
    on<FetchOrdersEvent>(_onFetchOrders);
    on<CreateOrderEvent>(_onCreateOrder);
  }

  Future<void> _onFetchOrders(
      FetchOrdersEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    final result = await orderRepository.fetchOrders();
    result.fold(
      (failure) => emit(OrderError(message: failure.message)),
      (orders) => emit(OrderLoaded(orders: orders)),
    );
  }

  Future<void> _onCreateOrder(
      CreateOrderEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    final result = await orderRepository.createOrder(event.order);
    result.fold(
      (failure) => emit(OrderError(message: failure.message)),
      (order) => emit(OrderCreated(order: order)),
    );
  }
}

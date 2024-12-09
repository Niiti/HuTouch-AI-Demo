// lib/features/product_detail/presentation/bloc/product_state.dart
import 'package:equatable/equatable.dart';
import '../../domain/entities/product_entity.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final ProductEntity product;

  ProductLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
// lib/features/product_detail/presentation/bloc/product_event.dart
import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProductDetail extends ProductEvent {}
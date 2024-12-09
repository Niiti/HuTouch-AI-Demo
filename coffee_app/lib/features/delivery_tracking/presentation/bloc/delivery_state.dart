import 'package:equatable/equatable.dart';
import '../../domain/entities/delivery_entity.dart';

abstract class DeliveryState extends Equatable {
  @override
  List<Object> get props => [];
}

class DeliveryInitial extends DeliveryState {}

class DeliveryLoading extends DeliveryState {}

class DeliveryLoaded extends DeliveryState {
  final DeliveryEntity delivery;

  DeliveryLoaded({required this.delivery});

  @override
  List<Object> get props => [delivery];
}

class DeliveryError extends DeliveryState {
  final String message;

  DeliveryError({required this.message});

  @override
  List<Object> get props => [message];
}

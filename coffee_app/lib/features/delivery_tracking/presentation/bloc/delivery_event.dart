import 'package:equatable/equatable.dart';

abstract class DeliveryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDeliveryStatusEvent extends DeliveryEvent {}

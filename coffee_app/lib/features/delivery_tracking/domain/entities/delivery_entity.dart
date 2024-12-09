import 'package:equatable/equatable.dart';

class DeliveryEntity extends Equatable {
  final String timeLeft;
  final String deliveryAddress;
  final String courierName;
  final String courierRole;
  final String courierPhone;
  final String backgroundImage;
  final String deliveryIcon;
  final String userIcon;
  final String phoneIcon;

  DeliveryEntity({
    required this.timeLeft,
    required this.deliveryAddress,
    required this.courierName,
    required this.courierRole,
    required this.courierPhone,
    required this.backgroundImage,
    required this.deliveryIcon,
    required this.userIcon,
    required this.phoneIcon,
  });

  @override
  List<Object> get props => [
        timeLeft,
        deliveryAddress,
        courierName,
        courierRole,
        courierPhone,
        backgroundImage,
        deliveryIcon,
        userIcon,
        phoneIcon,
      ];
}

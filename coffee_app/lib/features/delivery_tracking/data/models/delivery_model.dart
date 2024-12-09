import '../../domain/entities/delivery_entity.dart';

class DeliveryModel extends DeliveryEntity {
  DeliveryModel({
    required String timeLeft,
    required String deliveryAddress,
    required String courierName,
    required String courierRole,
    required String courierPhone,
    required String backgroundImage,
    required String deliveryIcon,
    required String userIcon,
    required String phoneIcon,
  }) : super(
          timeLeft: timeLeft,
          deliveryAddress: deliveryAddress,
          courierName: courierName,
          courierRole: courierRole,
          courierPhone: courierPhone,
          backgroundImage: backgroundImage,
          deliveryIcon: deliveryIcon,
          userIcon: userIcon,
          phoneIcon: phoneIcon,
        );

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      timeLeft: json['timeLeft'],
      deliveryAddress: json['deliveryAddress'],
      courierName: json['courierName'],
      courierRole: json['courierRole'],
      courierPhone: json['courierPhone'],
      backgroundImage: json['backgroundImage'],
      deliveryIcon: json['deliveryIcon'],
      userIcon: json['userIcon'],
      phoneIcon: json['phoneIcon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeLeft': timeLeft,
      'deliveryAddress': deliveryAddress,
      'courierName': courierName,
      'courierRole': courierRole,
      'courierPhone': courierPhone,
      'backgroundImage': backgroundImage,
      'deliveryIcon': deliveryIcon,
      'userIcon': userIcon,
      'phoneIcon': phoneIcon,
    };
  }
}

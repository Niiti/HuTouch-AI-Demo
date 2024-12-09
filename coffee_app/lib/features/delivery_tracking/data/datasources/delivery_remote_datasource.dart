import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/delivery_model.dart';
import '../../../../core/error/server_exception.dart';

abstract class DeliveryRemoteDataSource {
  Future<DeliveryModel> fetchDeliveryStatus();
}

class DeliveryRemoteDataSourceImpl implements DeliveryRemoteDataSource {
  final http.Client client;

  DeliveryRemoteDataSourceImpl({required this.client});

  @override
  Future<DeliveryModel> fetchDeliveryStatus() async {
    // Return mock data instead of making an API call
    return DeliveryModel(
      timeLeft: '20 mins', 
      deliveryAddress: '123 Coffee Street, Java City',
      courierName: 'John Doe', 
      courierRole: 'Courier',
      courierPhone: '+1234567890',
      backgroundImage: 'assets/images/map_image.jpg', 
      deliveryIcon: 'assets/images/delivery_icon.png',
      userIcon: 'assets/images/user_icon.png',
      phoneIcon: 'assets/images/phone_icon.png',
    );
  }
}

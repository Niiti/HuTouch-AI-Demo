import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../../../../configs/env_config.dart';
import '../models/order_model.dart';
import '../../../../core/constants/api_paths.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getOrders(); // Add this method
  Future<OrderModel> createOrder(OrderModel order);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final http.Client client;

  OrderRemoteDataSourceImpl({required this.client});

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await client.get(Uri.parse('API_URL_HERE'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => OrderModel.fromJson(json)).toList();
    } else {
      throw ServerException_1('Failed to fetch orders');
    }
  }

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    final response = await client.post(
      Uri.parse('API_URL_HERE'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(order.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return OrderModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException_1('Failed to create order');
    }
  }
}

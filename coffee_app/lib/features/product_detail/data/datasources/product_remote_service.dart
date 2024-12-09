// lib/features/product_detail/data/datasources/product_remote_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../configs/env_config.dart';
import '../../../../core/error/server_exception.dart';
import '../models/product_model.dart';
import '../../../../core/constants/api_endpoints.dart';

abstract class ProductRemoteService {
  Future<ProductModel> fetchProductDetail();
}

class ProductRemoteServiceImpl implements ProductRemoteService {
  final http.Client client;

  ProductRemoteServiceImpl({required this.client});

  @override
  Future<ProductModel> fetchProductDetail() async {
    final response = await client.get(
      Uri.parse('${EnvironmentConfiguration.apiBaseUrl}${ApiEndpoints.getProductDetail}'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException('Failed to load product details');
    }
  }
}
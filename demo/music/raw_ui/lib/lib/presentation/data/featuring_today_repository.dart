import 'dart:convert';
import 'package:dio/dio.dart';
import '../../models/feature_item.dart';

class FeaturingTodayRepository {
  final Dio _dio = Dio();

  Future<List<FeatureItem>> fetchFeaturingToday() async {
    try {
      final response = await _dio.get(
        'https://6fba403d-eaa7-4507-af58-82539765d405.mock.pstmn.io/featuring-today'
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        return data.map((item) => FeatureItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load featuring today items');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
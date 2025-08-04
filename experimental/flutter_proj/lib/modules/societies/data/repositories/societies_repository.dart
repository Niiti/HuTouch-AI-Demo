import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/society.dart';

abstract class ISocietiesRepository {
  Future<List<Society>> fetchSocieties();
}

class SocietiesRepository implements ISocietiesRepository {
  final String _baseUrl = 'https://6803759d-2bfb-4aa4-8ab1-ddc2ace685e8.mock.pstmn.io';

  @override
  Future<List<Society>> fetchSocieties() async {
    final response = await http.get(Uri.parse('$_baseUrl/get_societies'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Society.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load societies');
    }
  }
}

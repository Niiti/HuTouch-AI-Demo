import 'dart:convert';
import 'package:http/http.dart' as http;
import '../controllers/players_controller.dart';
import 'package:flutter/foundation.dart';

class PlayerService {
  static const String _baseUrl = 'https://6803759d-2bfb-4aa4-8ab1-ddc2ace685e8.mock.pstmn.io';

  Future<List<Player>> fetchPlayers() async {
    final response = await http.get(Uri.parse('$_baseUrl/get_players_data'));

    if (response.statusCode == 200) {
      return compute(_parsePlayers, response.body);
    } else {
      throw Exception('Failed to load players');
    }
  }
}

List<Player> _parsePlayers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Player>((json) => Player.fromJson(json)).toList();
}

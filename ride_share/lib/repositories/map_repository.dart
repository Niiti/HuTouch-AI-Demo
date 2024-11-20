import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../model/session_token.dart';

class MapRepository {
  final String apiKey;
  String? _sessionToken;

  MapRepository({required this.apiKey});

  Future<String> _createSessionToken() async {
    if (_sessionToken != null) {
      // Return cached session token to optimize network calls
      return _sessionToken!;
    }

    final Uri url = Uri.parse(
      'https://tile.googleapis.com/v1/createSession?key=$apiKey',
    );

    try {
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({
          "mapType": "roadmap",
          "language": "en-US",
          "region": "US",
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final sessionToken = SessionToken.fromJson(data);
        _sessionToken = sessionToken.session;
        return _sessionToken!;
      } else {
        throw Exception(
            'Failed to create session token: ${response.reasonPhrase}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<String> fetchMapTileUrl(int x, int y, int zoom) async {
    final sessionToken = await _createSessionToken();

    final Uri tileUrl = Uri.parse(
      'https://tile.googleapis.com/v1/2dtiles/$zoom/$x/$y?session=$sessionToken&key=$apiKey',
    );

    return tileUrl.toString();
  }
}
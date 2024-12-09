import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://api.example.com'), // Fixed baseUrl type
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
      errorConverter: JsonConverter(),
    );
    return _$ApiService(client);
  }

  @override
  Type get definitionType => ApiService;

  // Define your API endpoints here
}

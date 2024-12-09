import 'package:get/get.dart';
import '../services/PlayerService.dart';
import '../../../utils/error_handler.dart';
class Player {
  final int id;
  final String imageUrl;
  final String name;
  final String info;
  final String sport;
  final bool isFollowed;

  Player({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.info,
    required this.sport,
    required this.isFollowed,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      info: json['details'] as String,
      sport: json['sport'] as String,
      isFollowed: json['isFollowed'] == 'yes',
    );
  }
}

class PlayersController extends GetxController {
  var players = <Player>[].obs;
  final PlayerService _playerService = PlayerService();

  @override
  void onInit() {
    super.onInit();
    fetchPlayers();
  }

  void fetchPlayers() async {
    try {
      var data = await _playerService.fetchPlayers();
      players.assignAll(data);
    } catch (e) {
      ErrorHandler.showErrorMessage('Error fetching players: ${e.toString()}');
    }
  }
}

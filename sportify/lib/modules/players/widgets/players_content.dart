// lib/modules/dashboard/widgets/dashboard_content.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_values.dart';
import '../controllers/players_controller.dart';
import 'player_card.dart';
import '../../../utils/error_handler.dart';
import '../../../utils/responsive_helper.dart';

class PlayersContent extends StatelessWidget {
  final double width;
  final double height;

  const PlayersContent({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    PlayersController controller = Get.find();

    return Expanded(
      child: Obx(() {
        if (controller.players.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.players.length,
            itemBuilder: (context, index) {
              final player = controller.players[index];
              return PlayerCard(
                imageUrl: player.imageUrl,
                name: player.name,
                info: player.info,
                width: width,
              );
            },
          );
        }
      }),
    );
  }
}

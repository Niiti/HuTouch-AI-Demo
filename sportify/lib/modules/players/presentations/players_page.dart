// lib/modules/dashboard/presentations/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';
import '../../../utils/error_handler.dart';
import '../../../utils/responsive_helper.dart';
import '../controllers/players_controller.dart';
import '../widgets/players_header.dart';
import '../widgets/players_content.dart';
import '../widgets/players_footer.dart';

class PlayersPage extends StatelessWidget {
  final PlayersController controller = Get.put(PlayersController());

  @override
  Widget build(BuildContext context) {
    double width = ResponsiveHelper.screenWidth(context);
    double height = ResponsiveHelper.screenHeight(context);

    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              PlayersHeader(width: width),
              PlayersContent(width: width, height: height),
              PlayersFooter(width: width),
            ],
          ),
        ),
      ),
    );
  }
}

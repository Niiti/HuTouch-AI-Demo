// lib/modules/sport_screen/presentations/sport_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/images_assets.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_values.dart';
import '../../../utils/responsive_helper.dart';
import '../../../utils/error_handler.dart';
import '../controllers/sport_controller.dart';
import '../widgets/sport_header.dart';
import '../widgets/sport_body.dart';
import '../widgets/sport_footer.dart';

class SportPage extends StatelessWidget {
  final SportController controller = Get.put(SportController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontSizeScale = ResponsiveHelper.getFontSizeScale(size.width);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            SportHeader(fontSizeScale: fontSizeScale),
            Expanded(child: SportBody(fontSizeScale: fontSizeScale)),
          ],
        ),
      ),
      bottomNavigationBar: SportFooter(),
    );
  }
}

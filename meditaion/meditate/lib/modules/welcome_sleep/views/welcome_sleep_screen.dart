import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditate/modules/welcome_sleep/controllers/welcome_sleep_controller.dart';
import 'package:meditate/widgets/background_illustration.dart';
import 'package:meditate/widgets/title_text.dart';
import 'package:meditate/widgets/subtitle_text.dart';
import 'package:meditate/widgets/bird_illustration.dart';
import 'package:meditate/widgets/primary_action_button.dart';

class WelcomeSleepScreen extends StatelessWidget {
  const WelcomeSleepScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Instantiating controller with GetX for state management (if needed in future)
    final WelcomeSleepController controller = Get.put(WelcomeSleepController());
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundIllustration(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(flex: 2),
              SizedBox(height: 20),
              TitleText(),
              SubtitleText(),
              Spacer(flex: 3),
              BirdIllustration(),
              Spacer(flex: 2),
              PrimaryActionButton(),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

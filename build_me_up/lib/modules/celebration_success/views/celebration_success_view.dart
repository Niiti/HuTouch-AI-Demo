import 'package:build_me_up/widgets/buttons/hacker_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_images.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart' as cxt;
import 'package:build_me_up/core/constants/app_dimensions.dart';
import 'package:build_me_up/modules/celebration_success/controllers/celebration_success_controller.dart';
import 'package:build_me_up/modules/celebration_success/widgets/celebration_artwork.dart';
import 'package:build_me_up/modules/celebration_success/widgets/close_icon_button.dart';

class CelebrationSuccessView extends GetView<CelebrationSuccessController> {
  const CelebrationSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = cxt.ContextExtensionss(context).isPortrait;
    final double horizontalPadding = context.widthUnit * 4;
    final double topPadding = context.heightUnit * 2;
    final double gapSmall = context.heightUnit * 1.6;
    final double gapMedium = context.heightUnit * 2.4;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding,
                top: topPadding,
                bottom: gapSmall,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CloseIconButton(onTap: () => controller.close(false)),
              ),
            ),
            Expanded(
              child: Scrollbar(
                interactive: true,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          context.screenHeight * (isPortrait ? 0.52 : 0.4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CelebrationArtwork(
                          imagePath: AppImages.happyGreenApple,
                          maxWidthFactor: isPortrait ? 0.6 : 0.34,
                        ),
                        SizedBox(height: gapMedium),
                        Text(
                          'Great Start!',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: gapSmall),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.widthUnit * 6,
                          ),
                          child: const Text(
                            "You've fueled your day with a perfect breakfast!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                          ),
                        ),
                        SizedBox(height: gapMedium),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                gapSmall,
                horizontalPadding,
                gapSmall,
              ),
              child: SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: 'Done',
                  onPressed: () => controller.close(true),
                  height: (context.heightUnit * 6).clamp(
                    AppDimensions.minTapTarget,
                    60,
                  ),
                  borderRadius: BorderRadius.circular(context.heightUnit * 3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

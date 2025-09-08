import 'package:build_me_up/widgets/buttons/hacker_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_dimensions.dart';
import 'package:build_me_up/core/constants/app_images.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart' as cx;
import 'package:build_me_up/modules/one/controllers/one_controller.dart';

class OneView extends GetView<OneController> {
  const OneView({super.key});

  @override
  OneController get controller => Get.put(OneController());

  @override
  Widget build(BuildContext context) {
    final isPortrait = cx.ContextExtensionss(context).isPortrait;

    final h = context.screenHeight;
    final w = context.screenWidth;

    final horizontalPadding = w * AppDimensions.contentHPadPct;

    final buttonHeight = h * AppDimensions.buttonHeightPct;
    final buttonRadius = Radius.circular(
      h * AppDimensions.buttonRadiusPctOfHeight,
    );

    final topSpacer = SizedBox(height: h * AppDimensions.logoTopSpacerPct);
    final logo = FractionallySizedBox(
      widthFactor: AppDimensions.logoWidthFactor,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: h * AppDimensions.logoMaxHeightPct,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset(AppImages.logo05),
        ),
      ),
    );

    final title = Text(
      AppStrings.buildMeUp,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.brand,
        fontWeight: FontWeight.w700,
        fontSize: h * AppDimensions.titleFontPctOfH,
        height: 1.2,
      ),
    );

    final gapAfterTitle = SizedBox(
      height: h * AppDimensions.textToButtonsTopGapPct,
    );
    final gapBetweenButtons = SizedBox(
      height: h * AppDimensions.betweenButtonsGapPct,
    );

    final content = Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        0,
        horizontalPadding,
        h * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topSpacer,
          logo,
          title,
          gapAfterTitle,
          FractionallySizedBox(
            widthFactor: AppDimensions.buttonWidthFactor,
            child: PrimaryButton(
              text: AppStrings.signIn,
              onPressed: controller.onTapSignIn,
              enabled: true,
              height: buttonHeight,
              borderRadius: BorderRadius.all(buttonRadius),
              variant: PrimaryButtonVariant.filled,
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: h * 0.023758,
              ),
            ),
          ),
          gapBetweenButtons,
          FractionallySizedBox(
            widthFactor: AppDimensions.buttonWidthFactor,
            child: PrimaryButton(
              text: AppStrings.signUp,
              onPressed: controller.onTapSignUp,
              enabled: true,
              height: buttonHeight,
              borderRadius: BorderRadius.all(buttonRadius),
              variant: PrimaryButtonVariant.outlined,
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: h * 0.023758,
              ),
            ),
          ),
          if (!isPortrait) SizedBox(height: h * 0.02),
        ],
      ),
    );

    final mustScroll = h < 600 || ContextExtensionss(context).isLandscape;

    return Scaffold(
      body: SafeArea(
        child:
            mustScroll
                ? Scrollbar(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: content,
                  ),
                )
                : content,
      ),
    );
  }
}

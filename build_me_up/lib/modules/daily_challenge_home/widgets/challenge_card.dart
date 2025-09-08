import 'package:build_me_up/widgets/buttons/hacker_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart' as cx;
import 'package:build_me_up/modules/daily_challenge_home/controllers/home_controller.dart';
import 'package:build_me_up/modules/daily_challenge_home/widgets/nutrient_chip.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<DailyChallengeHomeController>();
    final cardRadius = BorderRadius.circular(context.heightUnit * 2.0);
    final padding = EdgeInsets.all(context.widthUnit * 4.0);
    final ringSize =
        cx.ContextExtensionss(context).isPortrait
            ? context.widthUnit * 42.0
            : context.heightUnit * 30.0;
    final stroke = context.heightUnit * 2.0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentGreen,
        borderRadius: cardRadius,
      ),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppStrings.todaysChallenge,
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.w700,
              fontSize: context.heightUnit * 2.0,
            ),
          ),
          SizedBox(height: context.heightUnit * 2.5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: ringSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(() {
                        final progress = (c.consumedKcal.value /
                                c.targetKcal.value)
                            .clamp(0.0, 1.0);
                        return SizedBox(
                          height: ringSize,
                          width: ringSize,
                          child: CircularProgressIndicator(
                            value: progress == 0 ? 0.01 : progress,
                            strokeWidth: stroke,
                            backgroundColor: AppColors.ringGreen.withOpacity(
                              0.35,
                            ),
                            color: AppColors.ringGreen,
                          ),
                        );
                      }),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.target,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: context.heightUnit * 2.0,
                              height: 1.1,
                            ),
                          ),
                          Obx(
                            () => Text(
                              AppStrings.targetKcal,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: context.heightUnit * 2.0,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: context.heightUnit * 1.6,
                          height: context.heightUnit * 1.6,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: context.widthUnit * 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => NutrientChip(
                      label: AppStrings.fat,
                      current: c.fatConsumed.value,
                      total: c.fatTarget.value,
                    ),
                  ),
                  SizedBox(height: context.heightUnit * 2.5),
                  Obx(
                    () => NutrientChip(
                      label: AppStrings.protein,
                      current: c.proteinConsumed.value,
                      total: c.proteinTarget.value,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: context.heightUnit * 2.5),
          PrimaryButton(
            text: AppStrings.start,
            onPressed: () => c.startChallenge(),
            height: context.heightUnit * 5.0,
            borderRadius: BorderRadius.circular(context.heightUnit * 2.2),
          ),
        ],
      ),
    );
  }
}

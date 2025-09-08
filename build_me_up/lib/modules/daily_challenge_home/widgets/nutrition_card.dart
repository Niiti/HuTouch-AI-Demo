import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_dimensions.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/daily_challenge_home/controllers/home_controller.dart';
import 'package:build_me_up/modules/daily_challenge_home/widgets/circular_gauge.dart';

class NutritionCard extends GetView<HomeController> {
  const NutritionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardPadding = EdgeInsets.all(context.widthUnit * 4);
    final corner = BorderRadius.circular(AppDimensions.radiusXL.toDouble());

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: context.widthUnit * 4),
      padding: cardPadding,
      decoration: BoxDecoration(
        color: AppColors.mintSurface,
        borderRadius: corner,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Obx(() {
              final size =
                  context.isPortrait
                      ? context.screenWidth * 0.34
                      : context.screenHeight * 0.34;
              return CircularGauge(
                size: size,
                thickness: size * 0.12,
                progress: controller.mainProgress,
                center: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.target,
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: context.heightUnit * 2.0,
                      ),
                    ),
                    SizedBox(height: context.heightUnit * 0.6),
                    Text(
                      '${controller.targetKcal.value} ${AppStrings.kcal}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: context.heightUnit * 2.4,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(width: context.widthUnit * 4),
          const Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MiniRing(title: AppStrings.fat, type: _MiniType.fat),
                SizedBox(height: 20),
                _MiniRing(title: AppStrings.protein, type: _MiniType.protein),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _MiniType { fat, protein }

class _MiniRing extends GetView<HomeController> {
  final String title;
  final _MiniType type;

  const _MiniRing({required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    final isFat = type == _MiniType.fat;
    final current = isFat ? controller.fatCurrent : controller.proteinCurrent;
    final target = isFat ? controller.fatTarget : controller.proteinTarget;

    final size = context.screenWidth * 0.2;
    final labelStyle = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
      fontSize: context.heightUnit * 1.8,
    );
    final titleStyle = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
      fontSize: context.heightUnit * 2.2,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => CircularGauge(
            size: size,
            thickness: size * 0.12,
            progress: controller.subProgress(current.value, target.value),
            center: Text(
              '${current.value}/\n${target.value}g',
              textAlign: TextAlign.center,
              style: labelStyle,
            ),
            trackColor: AppColors.lightMint,
            progressColor: AppColors.primary,
          ),
        ),
        SizedBox(width: context.widthUnit * 3),
        Text(title, style: titleStyle),
      ],
    );
  }
}

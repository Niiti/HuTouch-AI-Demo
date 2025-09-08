// file: lib/modules/daily_challenge_home/views/daily_challenge_home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/daily_challenge_home/controllers/home_controller.dart';
import 'package:build_me_up/core/routes/app_routes.dart';
import 'package:build_me_up/modules/daily_challenge_home/widgets/challenge_card.dart';
import 'package:build_me_up/modules/daily_challenge_home/widgets/day_chip.dart';
import 'package:build_me_up/modules/daily_challenge_home/widgets/greeting_header.dart';
import 'package:build_me_up/modules/daily_challenge_home/widgets/recipe_card.dart';
import 'package:build_me_up/modules/daily_challenge_home/widgets/sections_header.dart';

class DailyChallengeHomeView extends StatelessWidget {
  const DailyChallengeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DailyChallengeHomeController());

    final horizontalPadding = EdgeInsets.symmetric(
      horizontal: context.widthUnit * 4.5,
    );
    final daysScrollController = ScrollController();
    final recipesScrollController = ScrollController();

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: horizontalPadding.copyWith(
                top: context.heightUnit * 2.5,
                bottom: context.heightUnit * 2.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const GreetingHeader(),
                  SizedBox(height: context.heightUnit * 2.5),
                  const ChallengeCard(),
                  SizedBox(height: context.heightUnit * 2.5),
                  SectionsHeader(
                    title: AppStrings.last6Days,
                    onSeeMore: () => Get.toNamed(AppRoutes.days),
                  ),
                  SizedBox(height: context.heightUnit * 1.5),
                  SizedBox(
                    height: context.heightUnit * 8.5,
                    child: Obx(() {
                      final items =
                          Get.find<DailyChallengeHomeController>().lastSixDays;
                      return Scrollbar(
                        controller: daysScrollController,
                        thumbVisibility: false,
                        child: ListView.separated(
                          controller: daysScrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            final item = items[i];
                            return DayChip(
                              dayNumber: item.dayNumber,
                              active: item.completed,
                            );
                          },
                          separatorBuilder:
                              (_, __) =>
                                  SizedBox(width: context.widthUnit * 3.5),
                          itemCount: items.length,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: context.heightUnit * 2.0),
                  SectionsHeader(
                    title: AppStrings.recipes,
                    onSeeMore: () => Get.toNamed(AppRoutes.recipes),
                  ),
                  SizedBox(height: context.heightUnit * 1.5),
                  SizedBox(
                    height: context.heightUnit * 24.0,
                    child: Obx(() {
                      final items =
                          Get.find<DailyChallengeHomeController>().recipes;
                      return Scrollbar(
                        controller: recipesScrollController,
                        thumbVisibility: false,
                        child: ListView.separated(
                          controller: recipesScrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) {
                            final item = items[i];
                            return RecipeCard(
                              title: item.title,
                              kcal: item.calories, // updated
                              asset: item.image, // updated
                              onTap: () => Get.toNamed(AppRoutes.recipes),
                            );
                          },
                          separatorBuilder:
                              (_, __) =>
                                  SizedBox(width: context.widthUnit * 4.0),
                          itemCount: items.length,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: context.heightUnit * 2.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

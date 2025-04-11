import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/app_strings.dart';
import 'package:meditate/modules/reminders/controllers/reminders_controller.dart';
import 'package:meditate/widgets/background_illustration.dart';
import 'package:meditate/widgets/title_text.dart';
import 'package:meditate/widgets/subtitle_text.dart';
import 'package:meditate/widgets/time_selection_card.dart';
import 'package:meditate/widgets/day_button.dart';
import 'package:meditate/widgets/primary_action_button.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final RemindersController controller = Get.put(RemindersController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        final double horizontalPadding = width * 0.05;
        return Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            children: [
              const BackgroundIllustration(),
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: height),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.08),
                        DynamicTitleText(text: AppStrings.meditationQuestion),
                        SizedBox(height: height * 0.02),
                        DynamicSubtitleText(
                          text: AppStrings.meditationSuggestion,
                        ),
                        SizedBox(height: height * 0.04),
                        GestureDetector(
                          onTap: () => controller.selectTime(context),
                          child: Obx(
                            () => TimeSelectionCard(
                              screenWidth: width,
                              selectedTime: controller.selectedTime.value,
                              onTimeChanged: (newTime) {
                                controller.selectedTime.value = newTime;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        DynamicTitleText(text: AppStrings.dayQuestion),
                        SizedBox(height: height * 0.02),
                        DynamicSubtitleText(text: AppStrings.daySuggestion),
                        SizedBox(height: height * 0.03),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                              String dayLabel;
                              switch (index) {
                                case 0:
                                  dayLabel = 'SU';
                                  break;
                                case 1:
                                  dayLabel = 'M';
                                  break;
                                case 2:
                                  dayLabel = 'T';
                                  break;
                                case 3:
                                  dayLabel = 'W';
                                  break;
                                case 4:
                                  dayLabel = 'TH';
                                  break;
                                case 5:
                                  dayLabel = 'F';
                                  break;
                                case 6:
                                  dayLabel = 'S';
                                  break;
                                default:
                                  dayLabel = '';
                              }
                              return DayButton(
                                label: dayLabel,
                                selected: controller.selectedDays[index],
                                screenHeight: height,
                                onTap: () => controller.toggleDay(index),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        PrimaryActionButton(onTap: controller.savePreferences),
                        SizedBox(height: height * 0.02),
                        Center(
                          child: GestureDetector(
                            onTap: controller.skipPreferences,
                            child: Text(
                              AppStrings.noThanks,
                              style: TextStyle(
                                fontSize: height * 0.015625,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'HelveticaNeue',
                                color: AppColors.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Center(
                          child: Container(
                            width: width * 0.34541,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(230, 230, 230, 1),
                                width: 5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DynamicTitleText extends StatelessWidget {
  final String text;
  const DynamicTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.05, // 👈 less left padding
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Text(
        text,
        textAlign: TextAlign.start, // 👈 aligned left
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class DynamicSubtitleText extends StatelessWidget {
  final String text;
  const DynamicSubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.015,
        left:
            MediaQuery.of(context).size.width * 0.05, // 👈 same reduced padding
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Text(
        text,
        textAlign: TextAlign.start, // 👈 aligned left
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: Color.fromARGB(255, 206, 201, 201),
        ),
      ),
    );
  }
}

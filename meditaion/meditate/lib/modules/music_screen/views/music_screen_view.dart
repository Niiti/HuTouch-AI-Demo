import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/app_strings.dart';
import 'package:meditate/core/constants/image_assets.dart';
import 'package:meditate/modules/music_screen/controllers/music_controller.dart';
import 'package:meditate/widgets/narrator_option.dart';
import 'package:meditate/widgets/background_illustration.dart';
import 'package:meditate/widgets/title_text.dart';
import 'package:meditate/widgets/subtitle_text.dart';
import 'package:meditate/modules/reminders/views/reminders_screen.dart';

class MusicScreenView extends StatelessWidget {
  const MusicScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MusicController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.4,
            child: Stack(
              children: [
                const BackgroundIllustration(),
                Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.white,
                              size: width * 0.08,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: controller.toggleFavorite,
                                child: Obx(
                                  () => Icon(
                                    controller.isFavorited.value
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: AppColors.white,
                                    size: width * 0.08,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.05),
                              GestureDetector(
                                onTap: controller.shareCourse,
                                child: Icon(
                                  Icons.share,
                                  color: AppColors.white,
                                  size: width * 0.08,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(ImageAssets.cloudAndMoon, width: width * 3.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Using reusable TitleText for the main title
                  const CourseTitleText(),
                  SizedBox(height: height * 0.01),
                  // Using reusable SubtitleText for the course label
                  const CourseLabelText(),
                  SizedBox(height: height * 0.01),
                  // Course description remains inline as there is no matching reusable component.
                  Text(
                    AppStrings.courseDescription,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: AppColors.secondary,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Image.asset(ImageAssets.heartIcon, width: width * 0.05),
                      SizedBox(width: width * 0.02),
                      Text(
                        '24.234 ${AppStrings.favoritesLabel}',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: AppColors.secondary,
                        ),
                      ),
                      SizedBox(width: width * 0.1),
                      Icon(
                        Icons.headset,
                        color: AppColors.info,
                        size: width * 0.05,
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        '34.234 ${AppStrings.listeningLabel}',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    AppStrings.narratorPrompt,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:
                              () => controller.selectNarrator(
                                AppStrings.maleVoice,
                              ),
                          child: Text(
                            AppStrings.maleVoice,
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color:
                                  controller.selectedNarrator.value ==
                                          AppStrings.maleVoice
                                      ? AppColors.accent
                                      : AppColors.secondary,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.selectNarrator(AppStrings.femaleVoice);
                            Get.to(
                              () => const RemindersScreen(),
                            ); // 👈 navigate
                          },
                          child: Text(
                            AppStrings.femaleVoice,
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color:
                                  controller.selectedNarrator.value ==
                                          AppStrings.femaleVoice
                                      ? AppColors.accent
                                      : AppColors.secondary,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  Divider(color: AppColors.divider, thickness: 1),
                  SizedBox(height: height * 0.01),
                  Expanded(
                    child: ListView(
                      children: const [
                        NarratorOption(
                          title: 'Focus Attention',
                          duration: '10 MIN',
                          isSelected: true,
                        ),
                        NarratorOption(title: 'Body Scan', duration: '5 MIN'),
                        NarratorOption(
                          title: 'Making Happiness',
                          duration: '3 MIN',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

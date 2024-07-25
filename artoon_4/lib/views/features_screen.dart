import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/feature_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'widgets/ad_placeholder.dart';
import 'widgets/feature_card.dart';
import  'widgets/custom_button.dart';
import 'create_uploaded_photo_screen.dart';

class FeaturesScreen extends StatelessWidget {
  final FeatureController featureController = Get.put(FeatureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.featureTitle),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Obx(() => FeatureCard(
                    title: 'AI Art',
                    description: 'Elevate your pictures with advanced face swapping.',
                    icon: Icons.brush,
                    selected: featureController.selectedFeature.value == 'AI Art',
                    onTap: () => featureController.selectFeature('AI Art'),
                  )),
                  Obx(() => FeatureCard(
                    title: 'AI Enhance',
                    description: 'Enhance your image quality.',
                    icon: Icons.enhance_photo_translate,
                    selected: featureController.selectedFeature.value == 'AI Enhance',
                    onTap: () => featureController.selectFeature('AI Enhance'),
                  )),
                  Obx(() => FeatureCard(
                    title: 'AI Avatar',
                    description: 'Transform your selfie into diverse avatar styles.',
                    icon: Icons.person,
                    selected: featureController.selectedFeature.value == 'AI Avatar',
                    onTap: () => featureController.selectFeature('AI Avatar'),
                  )),
                  Obx(() => FeatureCard(
                    title: 'Text to Image',
                    description: 'Turn text into personalized avatars.',
                    icon: Icons.text_fields,
                    selected: featureController.selectedFeature.value == 'Text to Image',
                    onTap: () => featureController.selectFeature('Text to Image'),
                  )),
                  Obx(() => FeatureCard(
                    title: 'Face Me',
                    description: 'Lorem Ipsum is simply dummy text.',
                    icon: Icons.face,
                    selected: featureController.selectedFeature.value == 'Face Me',
                    onTap: () => featureController.selectFeature('Face Me'),
                  )),
                ],
              ),
            ),
            // Spacer(),
            CustomButton(
              text: AppStrings.next,
              color: AppColors.primary,
              textColor: Colors.white,
              onPressed: () {
                // Create action
                Get.to(() => CreateUploadedPhotoScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

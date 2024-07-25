import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/gender_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'widgets/gender_card.dart';
import 'widgets/custom_button.dart';
import 'go_premium_screen.dart';

class GenderSelectionScreen extends StatelessWidget {
  final GenderController genderController = Get.put(GenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.genderTitle),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.whatIsYourGender,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppStrings.genderDescription,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.secondaryText,
              ),
            ),
            SizedBox(height: 24),
            Obx(
              () => GenderCard(
                title: AppStrings.woman,
                description: AppStrings.tryDifferentLooks,
                icon: Icons.female,
                selected: genderController.selectedGender.value == 'Woman',
                onTap: () => genderController.selectGender('Woman'),
              ),
            ),
            Obx(
              () => GenderCard(
                title: AppStrings.man,
                description: AppStrings.tryDifferentLooks,
                icon: Icons.male,
                selected: genderController.selectedGender.value == 'Man',
                onTap: () => genderController.selectGender('Man'),
              ),
            ),
            Spacer(),
            CustomButton(
              text: AppStrings.createAvatars,
              color: AppColors.primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Get.to(() => GoPremiumScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

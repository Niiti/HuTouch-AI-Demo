import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/language_controller.dart';
import '../features_screen.dart';

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LanguageController _languageController = Get.find();

    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              disabledForegroundColor: Colors.blue.withOpacity(0.5).withOpacity(0.38), disabledBackgroundColor: Colors.blue.withOpacity(0.5).withOpacity(0.12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: _languageController.selectedLanguage.value != null
                ? () {
                    Get.to(FeaturesScreen());
                    // Get.snackbar('Next Button', 'Proceed to next step!');
                  }
                : null,
            child: Text('Next'),
          ),
        ),
      ),
    );
  }
}

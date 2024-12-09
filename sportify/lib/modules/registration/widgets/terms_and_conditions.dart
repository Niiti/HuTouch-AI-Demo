import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../modules/registration/controllers/registration_controller.dart';

class TermsAndConditions extends StatelessWidget {
  final RegistrationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Obx(
      () => Row(
        children: [
          Checkbox(
            value: controller.isChecked.value,
            onChanged: controller.toggleCheckbox,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: AppString.agreeTerms,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: width * 0.035,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: AppString.terms,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Terms tap
                      },
                  ),
                  TextSpan(text: AppString.and),
                  TextSpan(
                    text: AppString.privacyPolicy,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Privacy Policy tap
                      },
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

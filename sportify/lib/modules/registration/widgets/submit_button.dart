import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../modules/registration/controllers/registration_controller.dart';

class SubmitButton extends StatelessWidget {
  final RegistrationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.accentColor, // Use backgroundColor instead of primary
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
          ),
        ),
        onPressed: controller.createAccount,
        child: Text(
          AppString.createAccount,
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.bold,
            fontFamily: 'Bebas Neue',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

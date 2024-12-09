import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_values.dart';
import '../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  final double width;
  final double height;

  LoginForm({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
      children: [
        // Email input field
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(AppValues.borderRadius),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: AppString.emailHint,
              hintStyle: TextStyle(fontFamily: 'Azeret Mono'),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(width * 0.04),
            ),
            style: TextStyle(fontSize: width * 0.045),
            onChanged: controller.updateEmail,
          ),
        ),
        SizedBox(height: height * 0.02),
        // Password input field
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(AppValues.borderRadius),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: AppString.passwordHint,
              hintStyle: TextStyle(fontFamily: 'Azeret Mono'),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(width * 0.04),
            ),
            obscureText: true,
            style: TextStyle(fontSize: width * 0.045),
            onChanged: controller.updatePassword,
          ),
        ),
        // "Forget password?" link
        Align(
          alignment: Alignment.centerRight, // Align text to the right
          child: TextButton(
            onPressed: controller.forgotPassword,
            child: Text(
              AppString.forgotPassword,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: width * 0.035,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

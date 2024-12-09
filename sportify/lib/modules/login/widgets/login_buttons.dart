import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../controllers/login_controller.dart';
import 'triangular_clipper.dart';

class LoginButtons extends StatelessWidget {
  final double width;
  final double height;

  LoginButtons({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Column(
      children: [
        ClipPath(
          clipper: TriangularClipper(),
          child: GestureDetector(
            onTap: controller.signIn,
            child: Container(
              width: double.infinity,
              height: height * 0.07,
              color: AppColors.buttonColor,
              child: Center(
                child: Text(
                  AppString.signIn,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonTextColor,
                    fontFamily: 'Bebas Neue',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
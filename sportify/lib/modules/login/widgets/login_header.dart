import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';
import '../../../constants/app_values.dart';
import '../controllers/login_controller.dart';

class LoginHeader extends StatelessWidget {
  final double width;

  LoginHeader({required this.width});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();

    return Container(
      width: double.infinity,
      color: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: width * AppValues.paddingHorizontal,
        vertical: width * AppValues.paddingVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Logo and Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo and App Title
              Row(
                children: [
                  Image.asset(
                    ImagesAsset.appLogoWhite,
                    width: width * 0.08, // Adjust logo size
                  ),
                  SizedBox(width: width * 0.03), // Adjust spacing between logo and text
                  Text(
                    AppString.appTitle.toUpperCase(),
                    style: TextStyle(
                      fontSize: width * 0.09,
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                      fontFamily: 'Bebas Neue',
                    ),
                  ),
                ],
              ),
              // Status Icons
              Row(
                children: [
                  Icon(Icons.signal_cellular_4_bar,
                      color: AppColors.backgroundColor, size: width * 0.05),
                  SizedBox(width: width * 0.03),
                  Icon(Icons.wifi,
                      color: AppColors.backgroundColor, size: width * 0.05),
                  SizedBox(width: width * 0.03),
                  Icon(Icons.battery_full,
                      color: AppColors.backgroundColor, size: width * 0.05),
                ],
              ),
            ],
          ),
          // Spacing between rows
          SizedBox(height: width * 0.2),
          // "Sign in with your Sportify ID" Text
          Text(
            'Sign in with your Sportify ID',
            style: TextStyle(
              fontSize: width * 0.065, // Adjust font size
              
              color: AppColors.backgroundColor,
              fontFamily: 'Bebas Neue',
            ),
          ),
        ],
      ),
    );
  }
}

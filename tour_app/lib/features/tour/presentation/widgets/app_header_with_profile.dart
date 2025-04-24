import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/l10n/app_localizations.dart';

class AppHeaderWithProfile extends StatelessWidget {
  const AppHeaderWithProfile({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final localizations = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to user profile
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: const AssetImage('assets/images/user_image_1.png'),
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.welcomeBack,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: screenHeight * 0.015,
                      color: const Color.fromRGBO(87, 91, 102, 1),
                    ),
                  ),
                  Text(
                    localizations.userName,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: screenHeight * 0.02,
                      color: ColorPalette.primaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to notifications
          },
          child: Container(
            padding: EdgeInsets.all(screenWidth * 0.02),
            decoration: BoxDecoration(
              border: Border.all(color: ColorPalette.notificationBorder, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/images/bell_icon.png',
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
            ),
          ),
        )
      ],
    );
  }
}
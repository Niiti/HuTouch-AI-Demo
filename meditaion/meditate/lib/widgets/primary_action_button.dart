import 'package:flutter/material.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/app_strings.dart';
import 'package:meditate/modules/music_screen/views/music_screen_view.dart';
import 'package:get/get.dart';

class PrimaryActionButton extends StatelessWidget {
  final VoidCallback? onTap; // ✅ Add this line

  const PrimaryActionButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = MediaQuery.of(context).size.height * 0.07;
    final double buttonWidth = MediaQuery.of(context).size.width * 0.8;
    final double borderRadius = buttonHeight * 0.5;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed:
              onTap ??
              () {
                Get.to(() => const MusicScreenView()); // 👈 Default action
              },
          child: const Text(
            AppStrings.primaryButtonText,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}

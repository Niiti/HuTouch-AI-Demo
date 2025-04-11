import 'package:flutter/material.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/app_strings.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.015,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Text(
        AppStrings.subtitleText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────────────────────
// NEW SUBTITLE WIDGET ADDED BELOW — Does not affect existing one
// ────────────────────────────────────────────────────────────────

class CourseLabelText extends StatelessWidget {
  const CourseLabelText({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Text(
      AppStrings.courseLabel,
      style: TextStyle(fontSize: width * 0.04, color: AppColors.secondary),
    );
  }
}

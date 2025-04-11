import 'package:flutter/material.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/app_strings.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Text(
        AppStrings.titleText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// NEW CLASS ADDED BELOW — not replacing original
// ──────────────────────────────────────────────

class CourseTitleText extends StatelessWidget {
  const CourseTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Text(
      AppStrings.courseTitle,
      style: TextStyle(
        fontSize: width * 0.08,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }
}

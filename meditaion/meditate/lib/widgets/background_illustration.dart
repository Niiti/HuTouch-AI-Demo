import 'package:flutter/material.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/image_assets.dart';

class BackgroundIllustration extends StatelessWidget {
  const BackgroundIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        image: DecorationImage(
          image: AssetImage('assets/images/welcomesleepscreenbackground.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// NEW CODE ADDED BELOW — without affecting the original one
// ─────────────────────────────────────────────────────────

class DarkBackgroundIllustration extends StatelessWidget {
  const DarkBackgroundIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.darkBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

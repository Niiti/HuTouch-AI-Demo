import 'package:flutter/material.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';

class AppleStoreIcon extends StatelessWidget {
  const AppleStoreIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kSurfaceColor,
          image: DecorationImage(
            image: AssetImage('assets/images/apple_logo.png'),
            // fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

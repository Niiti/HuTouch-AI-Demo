import 'package:flutter/material.dart';
import 'package:my_project/core/constants/images_asset.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Center(
      child: Image.asset(
        ImagesAsset.appLogo,
        width: screenWidth * 0.5,
        fit: BoxFit.contain,
      ),
    );
  }
}

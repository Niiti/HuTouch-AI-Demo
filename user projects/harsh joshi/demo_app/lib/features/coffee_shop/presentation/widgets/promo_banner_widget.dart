// lib/features/coffee_shop/presentation/widgets/promo_banner_widget.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/color_palette.dart';
import '../../../../core/constants/theme_constants.dart';

class PromoBannerWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const PromoBannerWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        height: screenHeight * 0.18,
        decoration: BoxDecoration(
          color: ColorPalette.darkGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.02,
              left: screenWidth * 0.03,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.005,
                ),
                decoration: BoxDecoration(
                  color: ColorPalette.promoRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Promo', style: ThemeConstants.promoLabelText),
              ),
            ),
            Positioned(
              top: screenHeight * 0.06,
              left: screenWidth * 0.03,
              child: Text('Buy one get\none FREE',
                  style: ThemeConstants.promoTitleText),
            ),
            Positioned(
              right: screenWidth * 0.03,
              bottom: screenHeight * 0.02,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(345 / 360),
                child: CircleAvatar(
                  backgroundColor: ColorPalette.brown,
                  radius: screenHeight * 0.065,
                  backgroundImage: const AssetImage(
                    '${AppConstants.assetsPath}banner_image.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

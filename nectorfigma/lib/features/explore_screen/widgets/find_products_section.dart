import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';

class FindProductsSection extends StatelessWidget {
  const FindProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          AppStrings.findProducts,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.03,
            fontFamily: AppStrings.fontFamilyBold,
            color: ColorPalette.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

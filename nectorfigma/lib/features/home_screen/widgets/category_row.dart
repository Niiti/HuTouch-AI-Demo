import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';
import 'package:nectorfigma/features/home_screen/widgets/category_card.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: CategoryCard(
            color: ColorPalette.secondary.withOpacity(0.2),
            title: AppStrings.pulses,
            imageAsset: ImagesAsset.pulses,
          ),
        ),
        SizedBox(width: size.width * 0.02),
        Expanded(
          child: CategoryCard(
            color: ColorPalette.primary.withOpacity(0.2),
            title: AppStrings.rice,
            imageAsset: ImagesAsset.rice,
          ),
        ),
      ],
    );
  }
}

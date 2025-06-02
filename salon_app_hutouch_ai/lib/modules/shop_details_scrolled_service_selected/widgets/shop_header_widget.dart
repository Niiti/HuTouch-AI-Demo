import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';

class ShopHeaderWidget extends StatelessWidget {
  const ShopHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              Image.asset(
                ImagesAsset.bannerBackground,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
              ),
              Positioned(
                top: size.height * 0.02,
                left: size.width * 0.05,
                right: size.width * 0.05,
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        height: 40,
                        width: 40,
                        ImagesAsset.backButton,
                        errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
                      ),
                      iconSize: size.height * 0.04,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Image.asset(
                        height: 30,
                        width: 30,
                        ImagesAsset.heartIcon,
                        errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
                      ),
                      iconSize: size.height * 0.04,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        height: 40,
                        width: 40,
                        ImagesAsset.mapIcon,
                        errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
                      ),
                      iconSize: 10,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            // vertical: size.height * 0.015,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.shopTitle,
                style: TextStyle(
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Text(
                AppStrings.shopAddress,
                style: TextStyle(
                  fontSize: size.height * 0.02,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.02,
                      vertical: size.height * 0.005,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.openGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(size.height * 0.005),
                    ),
                    child: Text(
                      '[Open Today]',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        color: AppColors.openGreen,
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Row(
                    children: [
                      Image.asset(
                        ImagesAsset.tagIcon,
                        height: size.height * 0.02,
                        errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
                      ),
                      Text(
                        '-58% (6 pax available)',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),

                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.secondary,
                    size: size.height * 0.02,
                  ),
                  Text(
                    '4.7',
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' (2.7k)',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Image.asset(
                    ImagesAsset.eyeIcon,
                    height: size.height * 0.02,
                    errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
                  ),
                  Text(
                    '10k views',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

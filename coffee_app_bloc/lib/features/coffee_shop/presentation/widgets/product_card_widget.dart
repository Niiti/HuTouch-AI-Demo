import 'package:flutter/material.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../../../core/constants/color_palette.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String rating;
  final String title;
  final String subtitle;
  final String price;

  const ProductCardWidget({
    Key? key,
    required this.imageUrl,
    required this.rating,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  final Gradient ratingGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromRGBO(17, 17, 17, 1),
      Color.fromRGBO(48, 48, 48, 1)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Image Section
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              height: 120, // Fixed height to prevent overflow
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: ThemeConstants.productTitleText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                // Subtitle
                Text(
                  subtitle,
                  style: ThemeConstants.productSubtitleText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                // Price and Add-to-Cart Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: ThemeConstants.productPriceText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle add to cart
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorPalette.brown,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.add,
                          color: ColorPalette.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

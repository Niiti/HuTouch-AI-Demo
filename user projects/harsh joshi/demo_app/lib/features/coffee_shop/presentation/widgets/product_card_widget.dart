// lib/features/coffee_shop/presentation/widgets/product_card_widget.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/color_palette.dart';
import '../../../../core/constants/theme_constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: ThemeConstants.productTitleText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: ThemeConstants.productSubtitleText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price,
                        style: ThemeConstants.productPriceText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    GestureDetector(
                      onTap: () {
                        // TODO: Add to cart
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorPalette.brown,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.add,
                            color: ColorPalette.white, size: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

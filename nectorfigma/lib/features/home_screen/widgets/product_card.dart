import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';

class ProductCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: ColorPalette.border),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.4, // smaller height image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imageAsset, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              title,
              style: TextStyle(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
                color: ColorPalette.textPrimary,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: size.width * 0.035,
                color: ColorPalette.textSecondary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.textPrimary,
                  ),
                ),
                InkWell(
                  onTap: onAddToCart,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: size.width * 0.1,
                    height: size.width * 0.1,
                    decoration: BoxDecoration(
                      color: ColorPalette.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

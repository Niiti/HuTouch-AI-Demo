// lib/features/product_detail/presentation/widgets/product_image_widget.dart
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final String imageUrl;
  final double screenWidth;
  final double screenHeight;

  ProductImageWidget({
    required this.imageUrl,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        child: Image.asset(
          imageUrl,
          width: screenWidth * 0.9,
          height: screenHeight * 0.3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
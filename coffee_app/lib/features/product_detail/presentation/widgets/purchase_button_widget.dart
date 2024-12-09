// lib/features/product_detail/presentation/widgets/purchase_button_widget.dart
import 'package:flutter/material.dart';

class PurchaseButtonWidget extends StatelessWidget {
  final double screenWidth;
  final VoidCallback onPressed;

  PurchaseButtonWidget({
    required this.screenWidth,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Color(0xFFC67C4E), // Use backgroundColor instead of primary
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: screenWidth * 0.2,
        ),
      ),
      child: Text(
        'Buy Now',
        style: TextStyle(fontSize: screenWidth * 0.04),
      ),
    );
  }
}

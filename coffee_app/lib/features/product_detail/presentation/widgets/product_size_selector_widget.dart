// lib/features/product_detail/presentation/widgets/product_size_selector_widget.dart
import 'package:flutter/material.dart';

class ProductSizeSelectorWidget extends StatelessWidget {
  final String selectedSize;
  final Function(String) onSizeSelected;
  final double screenWidth;

  ProductSizeSelectorWidget({
    required this.selectedSize,
    required this.onSizeSelected,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['S', 'M', 'L'].map((size) {
            bool isSelected = selectedSize == size;
            return GestureDetector(
              onTap: () => onSizeSelected(size),
              child: Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.1,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFF9F2ED) : Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  border: Border.all(
                    color: isSelected ? Color(0xFFC67C4E) : Color(0xFFE3E3E3),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: isSelected ? Color(0xFFC67C4E) : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
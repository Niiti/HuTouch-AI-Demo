// Updated code by Hutouch
/* SELECTED CODE START */
import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';

class QuantityControlWidget extends StatelessWidget {
  final int quantity;
  final Function(int) onQuantityChanged;

  const QuantityControlWidget({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onQuantityChanged(-1),
          child: Image.asset(
            // Replaced Icon with Image.asset for 'remove' image
            'assets/images/remove_icon.png',
            height: MediaQuery.of(context).size.height * 0.04,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
          ),
          // Updated code by Hutouch
          /* SELECTED CODE START */
          child: Text(
            '\$${quantity}', // Changed quantity to variableQuantity
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.w600,
              fontFamily: 'Gilroy',
              color: ColorPalette.textPrimary,
            ),
          ),
          /* SELECTED CODE END */
        ),
        GestureDetector(
          onTap: () => onQuantityChanged(1),
          child: Image.asset(
              // Replaced Icon with Image.asset for 'add' image
              'assets/images/add_icon.png',
              height: MediaQuery.of(context).size.height * 0.04,
              color: ColorPalette.primary,
            ),
        ),
      ],
    );
  }
}

/* SELECTED CODE END */

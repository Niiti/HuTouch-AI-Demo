// Updated code by Hutouch
/* SELECTED CODE START */
// Updated code by Hutouch
/* SELECTED CODE START */
// Updated code by Hutouch
import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';

class CheckoutSectionWidget extends StatelessWidget {
  final double totalPrice;
  const CheckoutSectionWidget({super.key, required this.totalPrice});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.primary,
        borderRadius: BorderRadius.circular(20.0), // Added to make container corners circular
      ),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Modified to center align the Row
        children: [
          Text(
            'Go to Checkout',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.w600,
              fontFamily: 'Gilroy',
              color: Colors.white,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.08),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.005,
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(71, 157, 102, 1),
              borderRadius: BorderRadius.circular(50.0), // Modified for circular edges
            ),
            child: Text(
              '\$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gilroy',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/* SELECTED CODE END */
/* SELECTED CODE END */
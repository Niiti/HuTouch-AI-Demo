import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class PaymentSummarySection extends StatelessWidget {
  final double price;
  final double deliveryFee;

  const PaymentSummarySection({
    Key? key,
    required this.price,
    required this.deliveryFee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double originalDeliveryFee = deliveryFee * 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppConstants.textColor,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price',
              style: TextStyle(fontSize: 16, color: AppConstants.subtitleColor),
            ),
            Text(
              '\$ ${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppConstants.textColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style: TextStyle(fontSize: 16, color: AppConstants.subtitleColor),
            ),
            Row(
              children: [
                Text(
                  '\$ ${originalDeliveryFee.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppConstants.greyColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '\$ ${deliveryFee.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

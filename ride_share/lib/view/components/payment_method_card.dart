import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class PaymentMethodCard extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final Color borderColor;
  final Color backgroundColor;
  final String logo;
  final bool isSelected;
  final VoidCallback onTap;

  PaymentMethodCard({
    this.logo = '',
    required this.cardNumber,
    required this.expiryDate,
    this.borderColor = AppColors.textSecondary,
    this.backgroundColor = Colors.white,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.background : backgroundColor,
          border: Border.all(color: isSelected ? AppColors.primary : borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(logo, width: 45, height: 35, fit: BoxFit.cover),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardNumber,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  expiryDate,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
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

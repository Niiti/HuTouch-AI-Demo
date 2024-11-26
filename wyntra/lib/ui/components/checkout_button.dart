import 'package:flutter/material.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_colors.dart';

class CheckoutButton extends StatelessWidget {
  final VoidCallback onCheckout;

  CheckoutButton({required this.onCheckout});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: AppColors.backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: ElevatedButton(
          onPressed: onCheckout,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pinkColor,
            minimumSize: Size(double.infinity, 40),
            elevation: 0,
          ),
          child: Text(
            'Check out',
            style: AppStyles.roboto16w600White,
          ),
        ),
      ),
    );
  }
}
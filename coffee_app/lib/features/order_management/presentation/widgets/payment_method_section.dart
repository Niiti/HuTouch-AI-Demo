import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class PaymentMethodSection extends StatelessWidget {
  final VoidCallback onOrder;

  const PaymentMethodSection({Key? key, required this.onOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: AppConstants.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/wallet_icon.png', height: 24),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Cash/Wallet',
                  style: TextStyle(fontSize: 16, color: AppConstants.textColor),
                ),
              ),
              Text(
                '\$ 5.53',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryColor,
                ),
              ),
              Icon(Icons.arrow_drop_down, size: 24, color: AppConstants.textColor),
            ],
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: onOrder,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Order',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

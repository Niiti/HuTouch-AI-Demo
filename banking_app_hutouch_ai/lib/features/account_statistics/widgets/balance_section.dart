import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banking_app_hutouch_ai/core/constants/text_style.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('current_balance'.tr, style: AppTextStyles.subtitle),
          const SizedBox(height: 8),
          Text('\$8,545.00', style: AppTextStyles.balanceAmount),
        ],
      ),
    );
  }
}
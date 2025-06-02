import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banking_app_hutouch_ai/core/constants/text_style.dart';

class TransactionListItem extends StatelessWidget {
  final Widget icon;
  final String merchantName;
  final String subLabel;
  final String amount;
  final Color amountColor;
  final VoidCallback? onTap;
  final bool dense;
  const TransactionListItem({
    super.key,
    required this.icon,
    required this.merchantName,
    required this.subLabel,
    required this.amount,
    required this.amountColor,
    this.onTap,
    this.dense = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: dense ? 4 : 8, horizontal: 0),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                SizedBox(width: 48, height: 48, child: icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        merchantName.tr,
                        style: AppTextStyles.transactionTitle,
                      ),
                      Text(
                        subLabel.tr,
                        style: AppTextStyles.transactionSubtitle,
                      ),
                    ],
                  ),
                ),
                Text(
                  amount,
                  style: AppTextStyles.transactionTitle.copyWith(color: amountColor),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 60,
            right: 0,
            top: dense ? 6 : 10,
            bottom: 0,
          ),
          height: 1,
          color: Colors.grey.withOpacity(0.09),
        ),
      ],
    );
  }
}
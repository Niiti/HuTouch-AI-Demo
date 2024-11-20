import 'package:flutter/material.dart';
import '../../model/transaction_model.dart';
import '../../utils/app_colors.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (transaction.isExpense ?? false) ? AppColors.error.withOpacity(0.2) : AppColors.success.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset((transaction.isExpense ?? false) ? "assets/icons/Down.png" : "assets/icons/Up.png"),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.accountId!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    transaction.transactionDate.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.text.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            transaction.amount.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: (transaction.isExpense ?? false) ? AppColors.error : AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}

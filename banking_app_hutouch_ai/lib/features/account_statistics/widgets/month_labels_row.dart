// File: lib/features/account_statistics/widgets/month_labels_row.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/highlighted_month.dart';

class MonthLabelsRow extends StatelessWidget {
  final String selectedMonthKey;
  final ValueChanged<String> onMonthSelected;

  const MonthLabelsRow({
    super.key,
    required this.selectedMonthKey,
    required this.onMonthSelected,
  });

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      color: Color(0xFFA2A2A7),
    );

    const monthKeys = [
      'month_jan',
      'month_feb',
      'month_mar',
      'month_apr',
      'month_may',
      'month_jun',
      'month_jul',
      'month_aug',
      'month_sep',
      'month_oct',
      'month_nov',
      'month_dec'
    ];

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: monthKeys.map((key) {
          final isSelected = key == selectedMonthKey;
          return GestureDetector(
            onTap: () => onMonthSelected(key),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: isSelected
                  ? HighlightedMonth(monthKey: key)
                  : Center(child: Text(key.tr, style: labelStyle)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
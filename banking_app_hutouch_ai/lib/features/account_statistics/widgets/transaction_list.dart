import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/view_models/account_statistics_view_model.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/icons/apple_store_icon.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/icons/spotify_icon.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/icons/money_transfer_icon.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/transaction_list_item.dart';

import '../models/transaction_model.dart';

class TransactionList extends ConsumerWidget {
  const TransactionList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final transactions = ref.watch(transactionListProvider);
    return Scrollbar(
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];
          final Color amountColor = tx.isExpense
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.primary;
          Widget iconWidget;
          switch (tx.iconType) {
            case IconType.apple:
              iconWidget = const AppleStoreIcon();
              break;
            case IconType.spotify:
              iconWidget = const SpotifyIcon();
              break;
            case IconType.transfer:
              iconWidget = const MoneyTransferIcon();
              break;
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,),
            child: TransactionListItem(
              icon: iconWidget,
              merchantName: tx.titleKey,
              subLabel: tx.subtitleKey,
              amount: tx.amount,
              amountColor: amountColor,
              dense: false,
            ),
          );
        },
      ),
    );
  }
}


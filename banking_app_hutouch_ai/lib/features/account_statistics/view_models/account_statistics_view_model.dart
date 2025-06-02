import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/models/transaction_model.dart';

final selectedMonthProvider =
    StateNotifierProvider<AccountStatisticsViewModel, String>(
  (ref) => AccountStatisticsViewModel(),
);

final transactionListProvider = Provider<List<TransactionModel>>(
  (ref) => const [
    TransactionModel(
      iconType: IconType.apple,
      titleKey: 'apple_store',
      subtitleKey: 'entertainment',
      amount: '- \$5,99',
      isExpense: true,
    ),
    TransactionModel(
      iconType: IconType.spotify,
      titleKey: 'spotify',
      subtitleKey: 'music',
      amount: '- \$12,99',
      isExpense: true,
    ),
    TransactionModel(
      iconType: IconType.transfer,
      titleKey: 'money_transfer',
      subtitleKey: 'transaction',
      amount: '\$300',
      isExpense: false,
    ),
    TransactionModel(
      iconType: IconType.transfer,
      titleKey: 'money_transfer',
      subtitleKey: 'transaction',
      amount: '\$300',
      isExpense: false,
    ),
    TransactionModel(
      iconType: IconType.transfer,
      titleKey: 'money_transfer',
      subtitleKey: 'transaction',
      amount: '\$300',
      isExpense: false,
    ),
    TransactionModel(
      iconType: IconType.transfer,
      titleKey: 'money_transfer',
      subtitleKey: 'transaction',
      amount: '\$300',
      isExpense: false,
    ),
    TransactionModel(
      iconType: IconType.transfer,
      titleKey: 'money_transfer',
      subtitleKey: 'transaction',
      amount: '\$300',
      isExpense: false,
    ),
  ],
);

class AccountStatisticsViewModel extends StateNotifier<String> {
  AccountStatisticsViewModel() : super('month_jan');
  void selectMonth(String monthKey) => state = monthKey;
}
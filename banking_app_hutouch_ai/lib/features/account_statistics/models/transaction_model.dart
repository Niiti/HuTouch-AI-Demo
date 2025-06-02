enum IconType { apple, spotify, transfer }

class TransactionModel {
  final IconType iconType;
  final String titleKey;
  final String subtitleKey;
  final String amount;
  final bool isExpense;
  const TransactionModel({
    required this.iconType,
    required this.titleKey,
    required this.subtitleKey,
    required this.amount,
    required this.isExpense,
  });
}
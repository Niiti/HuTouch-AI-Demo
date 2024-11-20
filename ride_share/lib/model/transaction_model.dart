// class TransactionModel {
//   final String? name;
//   final String? date;
//   final String amount;
//   final bool ?isExpense;

//   TransactionModel({
//      this.name,
//      this.date,
//     required this.amount,
//      this.isExpense,
//   });
// }

class TransactionModel {
  final String transactionId;
  final String userId;
  final String accountId;
  final double amount;
  final String currency;
  final String transactionType;
  final String recipient;
  final String? recipientIcon;
  final String category;
  final String status;
  final DateTime transactionDate;
  final String? notes;
  final bool ?isExpense;

  TransactionModel({
    required this.transactionId,
    required this.userId,
    required this.accountId,
    required this.amount,
    required this.currency,
    required this.transactionType,
    required this.recipient,
    this.recipientIcon,
    required this.category,
    required this.status,
    required this.transactionDate,
    this.notes,
    this.isExpense,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId: map['transaction_id'] ?? '',
      userId: map['user_id'] ?? '',
      accountId: map['account_id'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      currency: map['currency'] ?? '',
      transactionType: map['transaction_type'] ?? '',
      recipient: map['recipient'] ?? '',
      recipientIcon: map['recipient_icon'],
      category: map['category'] ?? '',
      status: map['status'] ?? '',
      transactionDate: DateTime.parse(map['transaction_date']),
      notes: map['notes'],
    );
  }
}
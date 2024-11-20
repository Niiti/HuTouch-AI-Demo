// import 'package:get/get.dart';

// import '../model/transaction_model.dart';

// class WalletController extends GetxController {
//   var transactions = <TransactionModel>[
//     TransactionModel(name: 'Welton', date: 'Today at 09:20 am', amount: '-\$570.00', isExpense: true),
//     TransactionModel(name: 'Nathsam', date: 'Today at 09:20 am', amount: '\$570.00', isExpense: false),
//   ].obs;
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/transaction_model.dart';

class WalletController extends GetxController {
  var transactions = <TransactionModel>[].obs;

  @override
  void onInit() {
    fetchTransactions();
    super.onInit();
  }

  void fetchTransactions() async {
    final url = 'https://9a0d3d9b-27ed-46b7-87b1-48ece87b0ea6.mock.pstmn.io/user/wallet/transactions';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'success') {
          var transactionList = data['data']['transactions'] as List;
          transactions.value = transactionList
              .map((transaction) => TransactionModel.fromMap(transaction))
              .toList();
        }
      } else {
        // Handle unexpected status codes
      }
    } catch (e) {
      // Handle network or parsing errors
    }
  }
}
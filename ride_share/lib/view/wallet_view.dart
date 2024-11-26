import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/wallet_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_strings.dart';
import 'components/transaction_item.dart';
import 'transaction_view.dart';

class WalletView extends StatelessWidget {
  final WalletController controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.padding, vertical: AppConstants.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    ),
                    child: Center(
                      child: Image.asset("assets/icons/Hamburger Menu.png"),
                    ),
                  ),
                  Image.asset("assets/icons/Notification.png"),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(TransactionView());
                  // Add Money logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  child: Text(
                    AppStrings.addMoney,
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.padding, vertical: AppConstants.padding),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$500',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: AppColors.text,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            AppStrings.availableBalance,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: AppConstants.padding),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$200',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: AppColors.text,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            AppStrings.totalExpend,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.transactions,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // See All Transactions logic
                    },
                    child: Text(
                      AppStrings.seeAll,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.padding, vertical: 8.0),
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = controller.transactions[index];
                    return TransactionItem(transaction: transaction);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

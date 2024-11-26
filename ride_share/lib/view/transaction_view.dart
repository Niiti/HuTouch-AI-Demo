import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/payment_method_controller.dart';
import '../controller/transaction_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'components/back_button_widget.dart';
import '../utils/styles.dart';
import 'components/confirm_button.dart';
import 'components/payment_method_card.dart';


class TransactionView extends StatelessWidget {
  final paymentMethodController = Get.put(PaymentMethodController());
  final transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              BackButtonWidget2(),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.enterAmount,
                  hintStyle: AppStyles.hintStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: paymentMethodController.addPaymentMethod,
                  child: Text(
                    AppStrings.addPaymentMethod,
                    style: TextStyle(color: AppColors.secondary, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                AppStrings.selectPaymentMethod,
                style: AppStyles.subtitleStyle,
              ),
              SizedBox(height: 12),
              PaymentMethodCard(
                logo: 'assets/images/Payment-1.png',
                cardNumber: '**** **** **** 8970',
                expiryDate: 'Expires: 12/26',
                isSelected: paymentMethodController.selectedPaymentMethod.value == 'VISA',
                onTap: () => paymentMethodController.selectPaymentMethod('VISA'),
              ),
              SizedBox(height: 12),
              PaymentMethodCard(
                logo: 'assets/images/Payment-2.png',
                cardNumber: '**** **** **** 8970',
                expiryDate: 'Expires: 12/26',
                isSelected: paymentMethodController.selectedPaymentMethod.value == 'Mastercard',
                onTap: () => paymentMethodController.selectPaymentMethod('Mastercard'),
              ),
              SizedBox(height: 12),
              PaymentMethodCard(
                logo: 'assets/images/Payment-3.png',
                cardNumber: 'mailaddress@mail.com',
                expiryDate: 'Expires: 12/26',
                isSelected: paymentMethodController.selectedPaymentMethod.value == 'PayPal',
                onTap: () => paymentMethodController.selectPaymentMethod('PayPal'),
              ),
              SizedBox(height: 12),
              PaymentMethodCard(
                logo: 'assets/icons/wallet.png',
                cardNumber: 'Cash',
                expiryDate: 'Expires: 12/26',
                isSelected: paymentMethodController.selectedPaymentMethod.value == 'Cash',
                onTap: () => paymentMethodController.selectPaymentMethod('Cash'),
              ),
              SizedBox(height: 24),
              ConfirmButton(
                onPressed: transactionController.confirmTransaction,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

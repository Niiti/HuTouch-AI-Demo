import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';
import 'package:banking_app_hutouch_ai/core/constants/text_style.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('transaction'.tr, style: AppTextStyles.title),
          GestureDetector(
            onTap: () {},
            child: Text('sell_all'.tr,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: kPrimaryColor)),
          ),
        ],
      ),
    );
  }
}
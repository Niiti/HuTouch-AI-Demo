import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';

class HighlightedMonth extends StatelessWidget {
  final String monthKey;
  const HighlightedMonth({super.key, required this.monthKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(monthKey.tr,
            style: const TextStyle(
                fontSize: 14, fontFamily: 'Poppins', color: Colors.white)),
      ));
  }
}
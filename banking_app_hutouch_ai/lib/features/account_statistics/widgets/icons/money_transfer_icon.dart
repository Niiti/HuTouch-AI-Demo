import 'package:flutter/material.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/widgets/custom_icon_container.dart';

class MoneyTransferIcon extends StatelessWidget {
  const MoneyTransferIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomIconContainer(
      child: Icon(Icons.swap_horiz, color: kOnSurfaceColor),
    );
  }
}
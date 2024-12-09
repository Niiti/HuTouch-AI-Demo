// lib/modules/sport_screen/widgets/sport_option_item.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/error_handler.dart';

class SportOptionItem extends StatelessWidget {
  final String title;
  final String route;
  final double fontSizeScale;

  SportOptionItem({
    required this.title,
    required this.route,
    required this.fontSizeScale,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 16 * fontSizeScale,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: AppColors.divider,
            size: size.width * 0.07,
          ),
          onTap: () {
            Get.toNamed(route)?.catchError((error) {
              ErrorHandler.showErrorMessage(error.toString());
            });
          },
        ),
        Divider(height: 1, color: AppColors.divider),
      ],
    );
  }
}

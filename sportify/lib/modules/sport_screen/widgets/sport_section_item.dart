// lib/modules/sport_screen/widgets/sport_section_item.dart
import 'package:flutter/material.dart';
import '../../../utils/error_handler.dart';
import '../../../constants/app_colors.dart';
import 'package:get/get.dart';

class SportSectionItem extends StatelessWidget {
  final String title;
  final String description;
  final String route;
  final double fontSizeScale;

  SportSectionItem({
    required this.title,
    required this.description,
    required this.route,
    required this.fontSizeScale,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontSize: 18 * fontSizeScale,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            trailing: IconButton(
              icon:
                  Icon(Icons.add, color: Colors.black, size: size.width * 0.07),
              onPressed: () {
                Get.toNamed(route)?.catchError((error) {
                  ErrorHandler.showErrorMessage(error.toString());
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.02),
            child: Text(
              description,
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 12 * fontSizeScale,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

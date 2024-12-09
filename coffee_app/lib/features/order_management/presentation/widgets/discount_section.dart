import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class DiscountSection extends StatelessWidget {
  final VoidCallback onTap;

  const DiscountSection({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppConstants.greyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/discount_icon.png', height: 24),
                SizedBox(width: 8),
                Text(
                  '1 Discount is Applies',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppConstants.subtitleColor,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: AppConstants.subtitleColor),
          ],
        ),
      ),
    );
  }
}

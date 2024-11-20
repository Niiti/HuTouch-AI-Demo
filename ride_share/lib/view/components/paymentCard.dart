import 'package:flutter/material.dart';
import 'package:ride_share/utils/app_colors.dart';

class PaymentCard extends StatelessWidget {
  final String title;
  final String details;
  final String icon;
  final bool active;

  PaymentCard(
      {required this.title,
      required this.details,
      required this.icon,
      this.active = true});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: active ? 1.0 : 0.4,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Image.asset(icon, width: 45),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accent,
                    ),
                  ),
                  details.isNotEmpty
                      ? Text(
                          details,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

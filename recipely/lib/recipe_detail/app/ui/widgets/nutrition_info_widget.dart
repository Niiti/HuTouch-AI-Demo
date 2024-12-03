import 'package:flutter/material.dart';
import '../../../data/app_constants.dart';
import '../../../core/utils/responsive_util.dart';

class NutritionInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _nutritionItem('65g carbs', Icons.local_florist, width),
            _nutritionItem('27g proteins', Icons.restaurant, width),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _nutritionItem('120 Kcal', Icons.local_fire_department, width),
            _nutritionItem('91g fats', Icons.opacity, width),
          ],
        ),
      ],
    );
  }

  Widget _nutritionItem(String label, IconData icon, double width) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(width * 0.025),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppConstants.secondaryColor, size: width * 0.05),
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Sofia Pro',
              fontSize: width * 0.035,
              color: AppConstants.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

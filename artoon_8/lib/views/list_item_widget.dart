import 'package:flutter/material.dart';
import '../models/feature_model.dart';
import '../utils/app_styles.dart';

class ListItemWidget extends StatelessWidget {
  final FeatureModel feature;
  final VoidCallback onTap;

  const ListItemWidget({
    required this.feature,
    required this.onTap,
  });

  static const double iconSize = 30.0;
  static const double borderRadius = 8.0;
  static const EdgeInsets padding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );
  static const double shadowBlurRadius = 8.0;
  static const Offset shadowOffset = Offset(0, 4);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: padding,
        decoration: BoxDecoration(
          color: feature.fillColor,
          border: Border.all(color: feature.outlineColor),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: feature.shadowColor,
              offset: shadowOffset,
              blurRadius: shadowBlurRadius,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feature.mainText,
                    style: AppStyles.mainTextStyle,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    feature.subText,
                    style: AppStyles.subTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0),
            Image.asset(
              feature.iconPath,
              width: iconSize,
              height: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
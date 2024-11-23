import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle headingStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle subHeadingStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle categoryLabelStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.greyTextColor,
  );

  static const TextStyle productNameStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color(0xFF292929),
  );

  static const TextStyle productCategoryStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.greyTextColor,
  );

  static const TextStyle priceStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.priceColor,
  );

  static const TextStyle ratingStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Color(0xFF666666),
  );

  static const TextStyle promotionTitleStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.4285,
  );

  static const TextStyle promotionSubtitleStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.accentColor,
    height: 1.0,
  );

  static const TextStyle promotionDescriptionStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.promotionTextColor,
    height: 1.6666,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1.5384,
  );
  static const TextStyle headingStyle2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
    height: 1.0,
  );

  static const TextStyle subHeadingStyle2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.subTextColor,
    height: 1.4286,
  );

  static const TextStyle priceStyle2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
    height: 0.7273,
  );

  static const TextStyle discountStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.accentColor,
    height: 1.0,
  );

  static const TextStyle originalPriceStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.subTextColor,
    decoration: TextDecoration.lineThrough,
    height: 1.1429,
  );

  static const TextStyle ratingStyle2 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.borderColor,
    height: 1.1429,
  );

  static const TextStyle sizeTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
    height: 1.1429,
  );

  static const TextStyle selectedSizeTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
    height: 1.1429,
  );

  static const TextStyle descriptionTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.subTextColor,
    height: 1.3333,
  );

  static const TextStyle buttonTextStyle2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.backgroundColor,
    height: 1.25,
  );

  static const TextStyle addToCartTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    height: 1.25,
  );
    static const TextStyle montserrat22w600 = TextStyle(
    color: AppColors.textColor,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    height: 1.1,
  );

  static const TextStyle inter12w600 = TextStyle(
    color: AppColors.textColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    height: 1.33,
    overflow: TextOverflow.ellipsis,
  );

  static const TextStyle inter16w600 = TextStyle(
    color: AppColors.priceColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    height: 1,
  );

  static const TextStyle roboto16w600White = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Roboto',
    height: 1.25,
  );

  static const TextStyle roboto10w400 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 2,
  );

  static const TextStyle roboto10w600 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 2,
  );


  // Add other styles as needed
}

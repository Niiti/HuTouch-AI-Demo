import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';

class OpeningHoursWidget extends StatelessWidget {
  const OpeningHoursWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.015,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.openingHoursTitle,
            style: TextStyle(
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.mondayFriday,
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(width: size.width * 0.02),

                Text(
                  AppStrings.saturdaySunday,
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.mondayFridayHours,
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Text(
                  AppStrings.saturdaySundayHours,
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

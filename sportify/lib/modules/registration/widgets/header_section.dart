import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';


class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtain screen dimensions
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Container(
      color: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                ImagesAsset.appLogoWhite,
                width: width * 0.08,
              ),
              SizedBox(width: width * 0.02),
              Text(
                AppString.appName,
                style: TextStyle(
                  fontSize: width * 0.055,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bebas Neue',
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Icon(Icons.signal_cellular_alt, color: Colors.white),
              SizedBox(width: width * 0.02),
              Icon(Icons.battery_full, color: Colors.white),
            ],
          ),
          SizedBox(height: height * 0.02),
          Text(
            AppString.createSportifyId,
            style: TextStyle(
              fontSize: width * 0.075,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bebas Neue',
              color: Colors.white,
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(
            AppString.subtitle,
            style: TextStyle(
              fontSize: width * 0.035,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

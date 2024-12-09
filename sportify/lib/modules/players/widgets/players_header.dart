// lib/modules/dashboard/widgets/dashboard_header.dart
import 'package:flutter/material.dart';
import 'package:test5/constants/app_constants.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/images_assets.dart';

class PlayersHeader extends StatelessWidget {
  final double width;

  const PlayersHeader({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary, // Add red background color here
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: () {},
              ),
              Row(
                children: [
                  Icon(Icons.signal_cellular_alt, color: AppColors.white),
                  SizedBox(width: width * 0.02),
                  Icon(Icons.wifi, color: AppColors.white),
                  SizedBox(width: width * 0.02),
                  Icon(Icons.battery_full, color: AppColors.white),
                ],
              ),
            ],
          ),
          SizedBox(height: width * 0.04),
          Text(
            AppString.followYourPlayers,
            style: TextStyle(
              color: AppColors.white,
              fontSize: width * 0.07,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bebas Neue',
            ),
          ),
          SizedBox(height: width * 0.02),
          Text(
            AppString.followInfo,
            style: TextStyle(
              color: AppColors.white,
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
            ),
          ),
        ],
      ),
    );
  }
}

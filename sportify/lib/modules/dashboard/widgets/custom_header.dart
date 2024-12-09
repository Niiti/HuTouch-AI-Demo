// lib/modules/dashboard/widgets/custom_header.dart
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height * 0.25, // Adjust height as needed
      padding: EdgeInsets.all(width * 0.04),
      decoration: const BoxDecoration(
        color: AppColors.primaryRed,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row with Back Button and Status Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, color: AppColors.white),
                onPressed: () {},
              ),
              Row(
                children: const [
                  Icon(Icons.signal_cellular_alt,
                      color: AppColors.white, size: 20),
                  SizedBox(width: 5),
                  Icon(Icons.wifi, color: AppColors.white, size: 20),
                  SizedBox(width: 5),
                  Icon(Icons.battery_full, color: AppColors.white, size: 20),
                ],
              ),
            ],
          ),
          SizedBox(height: width * 0.1),
          // Text Content
          const Text(
            AppString.followYourTeams,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bebas Neue',
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            AppString.teamDescription,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

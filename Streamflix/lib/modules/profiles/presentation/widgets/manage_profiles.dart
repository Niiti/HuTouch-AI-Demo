import 'package:flutter/material.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/core/constants/images_asset.dart';

class ManageProfiles extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const ManageProfiles({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Image.asset(
            ImagesAsset.manageProfiles,
            width: screenHeight * 0.03,
            height: screenHeight * 0.03,
            color: Colors.white,
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            AppStrings.manageProfiles,
            style: TextStyle(
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

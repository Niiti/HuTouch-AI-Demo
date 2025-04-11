import 'package:flutter/material.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/core/constants/images_asset.dart';
import 'package:my_project/modules/splash/presentation/widgets/app_logo.dart';
import 'package:my_project/modules/splash/presentation/widgets/user_avatar.dart';

class TopBanner extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final VoidCallback onSearchTapped;
  final VoidCallback onPlayNowTapped;
  static const double _bannerFraction = 0.6;
  const TopBanner({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.onSearchTapped,
    required this.onPlayNowTapped,
  });
  @override
  Widget build(BuildContext context) {
    final bannerHeight = screenHeight * _bannerFraction;
    return SizedBox(
      width: screenWidth,
      height: bannerHeight,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(screenHeight * 0.02),
            child: Image.asset(
              ImagesAsset.drStrange,
              width: screenWidth,
              height: bannerHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.05,
            child: SizedBox(
              width: screenWidth * 0.1,
              child: Image.asset(ImagesAsset.sLogo, fit: BoxFit.contain),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            right: screenWidth * 0.2,
            child: GestureDetector(
              onTap: onSearchTapped,
              child: Image.asset(ImagesAsset.search, width: screenWidth * 0.1),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            right: screenWidth * 0.05,
            child: CircleAvatar(
              radius: screenWidth * 0.05,
              backgroundImage: AssetImage(ImagesAsset.profile1),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.tvShows,
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Colors.white,
                  ),
                ),
                Text(
                  AppStrings.movies,
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.categories,
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.1,
            left: screenWidth * 0.1,
            child: Image.asset(ImagesAsset.bookmark, width: screenWidth * 0.1),
          ),
          Positioned(
            bottom: screenHeight * 0.1,
            left: screenWidth * 0.4,
            child: GestureDetector(
              onTap: onPlayNowTapped,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.01,
                  ),
                  child: Row(
                    children: [
                      Image.asset(ImagesAsset.play, width: screenWidth * 0.05),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        AppStrings.playNow,
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.1,
            right: screenWidth * 0.1,
            child: Image.asset(ImagesAsset.download, width: screenWidth * 0.1),
          ),
          Positioned(
            bottom: screenHeight * 0.1,
            right: screenWidth * 0.1,
            child: Image.asset(ImagesAsset.download, width: screenWidth * 0.1),
          ),
        ],
      ),
    );
  }
}

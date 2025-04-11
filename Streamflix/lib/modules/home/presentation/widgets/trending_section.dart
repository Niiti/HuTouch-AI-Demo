import 'package:flutter/material.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/core/constants/images_asset.dart';

class TrendingSection extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const TrendingSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });
  @override
  Widget build(BuildContext context) {
    final sectionHeight = screenHeight * 0.25;
    return SizedBox(
      width: screenWidth,
      height: sectionHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.03,
              child: Text(
                AppStrings.trendingNow,
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Inter',
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: sectionHeight * 0.02),
            SizedBox(
              height: screenHeight * 0.2,
              child: Scrollbar(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(screenHeight * 0.015),
                      child: Image.asset(
                        ImagesAsset.movie1,
                        width: screenWidth * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(screenHeight * 0.015),
                      child: Image.asset(
                        ImagesAsset.movie2,
                        width: screenWidth * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(screenHeight * 0.015),
                      child: Image.asset(
                        ImagesAsset.movie3,
                        width: screenWidth * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

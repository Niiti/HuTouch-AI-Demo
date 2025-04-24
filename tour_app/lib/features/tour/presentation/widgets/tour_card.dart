import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';

class TourCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String date;
  final String price;
  final String location;
  final double rating;
  const TourCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.date,
    required this.price,
    required this.location,
    required this.rating,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Navigate to detailed tour info
      },
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.04),
        margin: EdgeInsets.only(bottom: screenWidth * 0.04),
        decoration: BoxDecoration(
          color: ColorPalette.cardBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageAsset,
                    width: screenWidth * 0.25,
                    height: screenWidth * 0.25,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image);
                    },
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: ColorPalette.primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.01),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/date_icon.png',
                            width: screenWidth * 0.04,
                            height: screenWidth * 0.04,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: ColorPalette.primaryText,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.01),
                      Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/dollar_icon.png',
                                width: screenWidth * 0.04,
                                height: screenWidth * 0.04,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                price,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: ColorPalette.primaryText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.06),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/location_icon.png',
                                width: screenWidth * 0.04,
                                height: screenWidth * 0.04,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                location,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: ColorPalette.primaryText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: ColorPalette.primaryText,
                    ),
                  ),
                  Image.asset(
                    'assets/images/star_icon.png',
                    width: screenWidth * 0.04,
                    height: screenWidth * 0.04,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

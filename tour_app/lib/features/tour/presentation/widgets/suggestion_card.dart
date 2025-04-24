import 'package:flutter/material.dart';
import 'package:my_project/features/tour/presentation/pages/detailed_tour_screen.dart';

class SuggestionCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String location;
  final double rating;
  const SuggestionCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.location,
    required this.rating,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Navigate to detailed destination info
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailedTourScreen()),
        );

      },
      child: Container(
        width: screenWidth * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color.fromRGBO(0, 0, 0, 0.42),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenWidth * 0.04,
              right: screenWidth * 0.04,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenWidth * 0.01),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Image.asset(
                      'assets/images/star_icon.png',
                      width: screenWidth * 0.04,
                      height: screenWidth * 0.04,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/location_white_image.png',
                        width: screenWidth * 0.04,
                        height: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
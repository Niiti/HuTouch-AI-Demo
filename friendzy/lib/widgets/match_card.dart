import 'package:dating3/screens/dating_user_screen.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/match_card_data.dart';
import '../screens/profile_screen.dart';

class MatchCard extends StatelessWidget {
  final MatchCardData data;

  MatchCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to individual match profile
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DatingUserScreen(data: data)),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: primaryColor,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset(
                data.imageAsset ?? defaultProfileImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 98,
              height: 24,
              color: primaryColor,
              alignment: Alignment.center,
              child: Text(
                data.matchPercentage,
                style: matchPercentageTextStyle,
              ),
            ),
          ),
          Positioned(
            bottom: 36,
            left: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${data.name}, ${data.age}',
                  style: nameAgeTextStyle,
                ),
                SizedBox(width: 8.0),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: greenDotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              data.location.toUpperCase(),
              style: locationTextStyle,
            ),
          ),
          Positioned(
            bottom: 72,
            left: 8,
            child: Container(
              height: 22,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              alignment: Alignment.center,
              child: Text(
                data.distance,
                style: distanceTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

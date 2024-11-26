// lib/widgets/user_card.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/user_card_data.dart';

class UserCard extends StatelessWidget {
  final UserCardData userCardData;

  UserCard({required this.userCardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      margin: EdgeInsets.only(left: kDefaultPadding),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              userCardData.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 41,
              height: 22,
              decoration: BoxDecoration(
                color: kTextColor,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Center(
                child: Text(
                  'NEW',
                  style: TextStyle(
                    fontFamily: 'Hellix',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: kWhiteColor,
                    height: 1.25,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 64,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 22,
              decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
                backgroundBlendMode: BlendMode.overlay,
              ),
              child: Center(
                child: Text(
                  userCardData.distance,
                  style: TextStyle(
                    fontFamily: 'Hellix',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor,
                    height: 1.27,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 8,
            child: Text(
              '${userCardData.name}, ${userCardData.age}',
              style: TextStyle(
                fontFamily: 'Hellix',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: kWhiteColor,
                height: 1.4,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 8,
            child: Opacity(
              opacity: 0.7,
              child: Text(
                userCardData.location,
                style: TextStyle(
                  fontFamily: 'Hellix',
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: kWhiteColor,
                  letterSpacing: 2,
                  height: 1.27,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

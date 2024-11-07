// lib/widgets/discover_section.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/user_card_data.dart';
import 'user_card.dart';
import '../screens/user_profile_screen.dart';

class DiscoverSection extends StatelessWidget {
  final List<UserCardData> userCards;

  DiscoverSection({required this.userCards});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            'Discover',
            style: TextStyle(
              fontFamily: 'Hellix',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: kPrimaryColor,
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: userCards.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to user profile
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UserProfileScreen(userCardData: userCards[index]),
                    ),
                  );
                },
                child: UserCard(userCardData: userCards[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

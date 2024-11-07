import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/likes_connect_icon.dart';
import '../widgets/match_cards_grid.dart';
import '../screens/likes_screen.dart';
import '../screens/connections_screen.dart';

class BodySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikesConnectIcon(
                  iconAsset: 'assets/like.png',
                  count: 32,
                  label: 'Likes',
                  gradientColors: [primaryColor, secondaryColor],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LikesScreen()),
                    );
                  },
                ),
                LikesConnectIcon(
                  iconAsset: 'assets/comments_white_icon.png',
                  count: 15,
                  label: 'Connect',
                  gradientColors: [primaryColor, secondaryColor],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConnectionsScreen()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: elementSpacing),
            Text(
              'Your Matches 47',
              style: sectionTitleTextStyle,
            ),
            SizedBox(height: elementSpacing),
            MatchCardsGrid(),
            SizedBox(height: elementSpacing),
          ],
        ),
      ),
    );
  }
}

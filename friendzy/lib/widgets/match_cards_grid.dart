import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/match_card_data.dart';
import '../widgets/match_card.dart';

class MatchCardsGrid extends StatelessWidget {
  final List<MatchCardData> matchCards = [
    MatchCardData(
      name: 'James',
      age: 20,
      distance: '1.3 km',
      matchPercentage: '100% Match',
      imageAsset: 'assets/james.png',
      location: 'HANOVER',
      matchPercentValue: 100,
      about: ' I am a Certified Ethical Hacker and I love to hack.',
    ),
    MatchCardData(
      name: 'Eddie',
      age: 23,
      distance: '2 km',
      matchPercentage: '94% Match',
      imageAsset: 'assets/eddie.png',
      location: 'DORTMUND',
      matchPercentValue: 94,
      about: 'I am a Web Developer and I love to code.',
    ),
    MatchCardData(
      name: 'Brandon',
      age: 20,
      distance: '0.5 km',
      matchPercentage: '89% Match',
      imageAsset: 'assets/brandon.png',
      location: 'HAMBURG',
      matchPercentValue: 89,
      about: 'I am a QA engineer and I love to test.',
    ),
    MatchCardData(
      name: 'Alfredo',
      age: 20,
      distance: '2.5 km',
      matchPercentage: '80% Match',
      imageAsset: 'assets/james.png',
      location: 'HAMBURG',
      matchPercentValue: 80,
      about: 'I am a software engineer and I love to code.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: matchCards.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: elementSpacing,
        mainAxisSpacing: 24.0,
        childAspectRatio: 0.7, // Adjust for responsive design
      ),
      itemBuilder: (context, index) {
        MatchCardData data = matchCards[index];
        return MatchCard(data: data);
      },
    );
  }
}

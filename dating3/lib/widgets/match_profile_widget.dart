import 'package:flutter/material.dart';
import '../models/match_profile.dart';

class MatchProfileWidget extends StatelessWidget {
  final MatchProfile profile;

  const MatchProfileWidget({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 92,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(profile.imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
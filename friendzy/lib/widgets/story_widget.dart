import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/story.dart';

class StoryWidget extends StatelessWidget {
  final Story story;

  StoryWidget({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kAccentColor,
                    width: 4,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(story.imagePath),
                  radius: 28,
                ),
              ),
              if (story.isMyStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: kAccentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            story.label,
            style: TextStyle(
              color: kTextColor,
              fontSize: 14,
              fontFamily: 'Hellix',
              fontWeight: FontWeight.w400,
              height: 19.6 / 14,
            ),
          ),
        ],
      ),
    );
  }
}

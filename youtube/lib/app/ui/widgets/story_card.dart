import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class StoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String views;

  const StoryCard({
    required Key key,
    required this.image,
    required this.title,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.42;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              height: height * 0.2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(
            title,
            style: TextStyle(
              fontSize: AppConstants.storyTitleFontSize,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            views,
            style: TextStyle(
              fontSize: AppConstants.storyViewsFontSize,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/art_model.dart';

class TrendingAvatar extends StatelessWidget {
  final ArtModel avatar;

  TrendingAvatar({required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(avatar.imageUrl),
              if (avatar.isSelected)
                Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(Icons.check_circle, color: Colors.blue),
                )
            ],
          ),
          SizedBox(height: 4.0),
          Text(
            avatar.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

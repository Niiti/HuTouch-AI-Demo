import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageAsset;
  const UserAvatar({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        imageAsset,
        width: screenWidth * 0.35,
        height: screenWidth * 0.35,
        fit: BoxFit.cover,
      ),
    );
  }
}

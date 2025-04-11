import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String imageAsset;
  final String name;
  const ProfileItem({super.key, required this.imageAsset, required this.name});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: screenHeight * 0.1,
            height: screenHeight * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight * 0.01),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            name,
            style: TextStyle(
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

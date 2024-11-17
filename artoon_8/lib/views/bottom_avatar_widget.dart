import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';
import '../../utils/app_colors.dart';

class BottomAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: AvatarCard(
              imagePath: 'assets/images/autumn_3d.png',
              title: 'Autumn 3D',
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: AvatarCard(
              imagePath: 'assets/images/autumn_3d.png',
              title: 'Autumn 3D',
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarCard extends StatelessWidget {
  final String imagePath;
  final String title;

  AvatarCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation to avatar preview
      },
      child: Stack(
        children: [
          // Single Image Container
          Container(
            height: 270.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.backgroundColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 270.0,
                width: double.infinity,
              ),
            ),
          ),
          // Gradient overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 52.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.0),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Text Overlay
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: Text(
              title,
              style: AppStyles.cardTitle,
            ),
          ),
        ],
      ),
    );
  }
}
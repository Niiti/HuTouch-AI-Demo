// lib/views/widgets/top_avatar_widget.dart
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class TopAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Handle navigation to AUTUMN 3D feature
            },
            child: Container(
              height: 198.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Left Image
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0),
                      ),
                      child: Image.asset(
                        'assets/images/image.png',
                        fit: BoxFit.cover,
                        height: 198.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Gradient Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 23.27,
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
            bottom: 40.0,
            left: 24.0,
            child: Text(
              'Autumn 3D',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontSize: 12.53,
                fontWeight: FontWeight.w700,
                color: AppColors.textColorLight,
                height: 0.7859,
              ),
            ),
          ),
          // Try Now Button
          Positioned(
            bottom: 16.0,
            right: 24.0,
            child: GestureDetector(
              onTap: () {
                // Navigate to AUTUMN 3D feature
              },
              child: Container(
                width: 38.49,
                height: 23.27,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Center(
                  child: Text(
                    'Try',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 10.74,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textColorLight,
                      height: 0.7859,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

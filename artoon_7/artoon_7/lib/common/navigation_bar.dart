
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Implement navigation functionality here
              print("Navigating to AI Art screen");
            },
            child: Image.asset(
              'assets/icons/ai_art.png',
              height: 24,
              width: 24,
            ),
          ),
          label: 'AI Art',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Implement navigation functionality here
              print("Navigating to AI Enhance screen");
            },
            child: Image.asset(
              'assets/icons/ai_enhance.png',
              height: 24,
              width: 24,
            ),
          ),
          label: 'AI Enhance',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Implement navigation functionality here
              print("Navigating to ArtoonAI screen");
            },
            child: Image.asset(
              'assets/icons/ai_avatar.png',
              height: 24,
              width: 24,
            ),
          ),
          label: 'ArtoonAI',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Implement navigation functionality here
              print("Navigating to AI Image screen");
            },
            child: Image.asset(
              'assets/icons/text_to_image.png',
              height: 24,
              width: 24,
            ),
          ),
          label: 'AI Image',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Implement navigation functionality here
              print("Navigating to Profile screen");
            },
            child: Image.asset(
              'assets/icons/face_me.png',
              height: 24,
              width: 24,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
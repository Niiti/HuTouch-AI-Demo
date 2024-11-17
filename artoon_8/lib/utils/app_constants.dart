import 'package:flutter/material.dart';

class AppConstants {
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 16.0;
  static const double verticalSpacing = 24.0;
  static const double buttonHeight = 48.0;
  static const double adHeight = 164.0;
  static const double homeIndicatorWidth = 117.65;
  static const double homeIndicatorHeight = 4.38;

  static const List<String> categories = [
    'TRENDING',
    'FASHION',
    'ANIME',
    'DIGITAL ART',
  ];

  static const List<Map<String, String>> bottomNavItems = [
    {'icon': 'assets/icons/ai_art.png', 'label': 'AI Art'},
    {'icon': 'assets/icons/ai_enhance.png', 'label': 'AI Enhance'},
    {'icon': 'assets/icons/face_me.png', 'label': 'ArtoonAI'},
    {'icon': 'assets/icons/text_to_image.png', 'label': 'AI Image'},
    {'icon': '', 'label': 'Profile'},
  ];

}
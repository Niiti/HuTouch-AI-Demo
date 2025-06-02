 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/views/salon_details_page.dart';

// Obsolete. Avatar row now uses AvatarCircleList.
class StoryAvatar extends StatelessWidget {
  final String imagePath;

  const StoryAvatar({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
 

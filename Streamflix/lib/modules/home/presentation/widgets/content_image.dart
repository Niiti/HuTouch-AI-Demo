// Updated code by Hutouch
import 'package:flutter/material.dart';
import 'package:my_project/core/constants/images_asset.dart';

class ContentImage extends StatelessWidget {
  const ContentImage({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        Image.asset(
          ImagesAsset.movieScreen,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: mediaQuery.size.width * 0.03,
          bottom:
              mediaQuery.size.height *
              0.05, // Adjusted position for progress bar
          child: Container(
            color: Colors.black54,
            padding: EdgeInsets.all(mediaQuery.size.width * 0.01),
            child: const Text('Trailer', style: TextStyle(color: Colors.white)),
          ),
        ),
        Positioned(
          right: mediaQuery.size.width * 0.03,
          bottom:
              mediaQuery.size.height *
              0.05, // Adjusted position for progress bar
          child: const Text('30:06', style: TextStyle(color: Colors.white)),
        ),
        Positioned(
          // Added Positioned widget for progress bar
          bottom: 0, // Positioning progress bar at the bottom
          left: 0,
          right: 0,
          child: LinearProgressIndicator(
            value: 0.3, // Example progress value
            backgroundColor: Colors.black26,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        ),
      ],
    );
  }
}

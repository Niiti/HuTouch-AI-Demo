import 'package:flutter/material.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class CelebrationArtwork extends StatelessWidget {
  final String imagePath;
  final double maxWidthFactor;

  const CelebrationArtwork({
    super.key,
    required this.imagePath,
    this.maxWidthFactor = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    final double maxW = (context.screenWidth * maxWidthFactor).clamp(
      120,
      context.screenWidth,
    );
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxW),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: FittedBox(fit: BoxFit.contain, child: Image.asset(imagePath)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PromotionalBanner extends StatelessWidget {
  final List<String> banners;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const PromotionalBanner({
    super.key,
    required this.banners,
    required this.currentIndex,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              banners[currentIndex],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: onPrevious,
            ),
          ),
          Positioned(
            right: 10,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}
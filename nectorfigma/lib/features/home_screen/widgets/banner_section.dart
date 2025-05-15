import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  final List<String> banners;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  const BannerSection({
    super.key,
    required this.banners,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 6,
      child: PageView.builder(
        itemCount: banners.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(banners[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
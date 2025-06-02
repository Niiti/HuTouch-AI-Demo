import 'package:flutter/material.dart';

class GalleryImageWidget extends StatelessWidget {
  final String imageAsset;
  const GalleryImageWidget({required this.imageAsset, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.height * 0.012),
        child: Image.asset(
          imageAsset,
          width: 154,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
        ),
      ),
    );
  }
}

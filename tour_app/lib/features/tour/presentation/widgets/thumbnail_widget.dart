import 'package:flutter/material.dart';

class ThumbnailWidget extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  const ThumbnailWidget({
    super.key,
    required this.imagePath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.005),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenHeight * 0.007389),
        border:
            isSelected
                ? Border.all(
                  color: const Color.fromRGBO(104, 109, 205, 1),
                  width: 2,
                )
                : null,
      ),
      child: SizedBox(
        height: screenHeight * 0.1, // or any suitable height
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

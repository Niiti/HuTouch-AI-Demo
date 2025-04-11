import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constants/images_asset.dart';

class BackArrowScreenTitle extends StatelessWidget {
  final String title;
  final double iconSize;
  const BackArrowScreenTitle({
    Key? key,
    required this.title,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Image.asset(
            ImagesAsset.leftArrow,
            width: screenHeight * 0.04,
            height: screenHeight * 0.04,
            color: Colors.white,
          ),
        ),
        SizedBox(width: screenHeight * 0.02),
        Text(
          title,
          style: TextStyle(
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // ScreenTitle(title: title),
      ],
    );
  }
}

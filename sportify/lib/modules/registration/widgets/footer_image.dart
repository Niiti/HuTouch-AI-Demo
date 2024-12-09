import 'package:flutter/material.dart';
import '../../../constants/images_assets.dart';
class FooterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Image.asset(
        ImagesAsset.womanAthleteImage,
        width: width * 0.8,
      ),
    );
  }
}

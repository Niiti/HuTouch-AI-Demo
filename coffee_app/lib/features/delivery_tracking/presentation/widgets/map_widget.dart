import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  final String backgroundImagePath;

  MapWidget({required this.backgroundImagePath});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

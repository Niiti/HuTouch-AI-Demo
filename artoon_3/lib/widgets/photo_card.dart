import 'package:artoon_3/resources/colors.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final String photoUrl;
  final double width;
  final double height;
  final VoidCallback onTap;
  final bool isDemo;

  PhotoCard({
    required this.photoUrl,
    required this.onTap,
    this.width = 180,
    this.height = 180,
    this.isDemo = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Image.network(photoUrl,
                width: width, height: height, fit: BoxFit.cover),
            if (isDemo)
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  color: AppColors.demoBgColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      "demoText",
                      style: TextStyle(
                        color: AppColors.demoTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

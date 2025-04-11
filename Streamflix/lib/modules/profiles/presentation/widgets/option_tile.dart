import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String iconAsset;
  final String title;
  final VoidCallback onTap;
  const OptionTile({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.iconAsset,
    required this.title,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
        padding: EdgeInsets.all(screenHeight * 0.02),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(23, 22, 22, 1),
          borderRadius: BorderRadius.circular(screenHeight * 0.005),
        ),
        child: Row(
          children: [
            Image.asset(
              iconAsset,
              width: screenHeight * 0.03,
              height: screenHeight * 0.03,
              color: Colors.white,
            ),
            SizedBox(width: screenWidth * 0.05),
            Text(
              title,
              style: TextStyle(
                fontSize: screenHeight * 0.023,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

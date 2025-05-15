import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color color;
  final String title;
  final String imageAsset;
  const CategoryCard({
    super.key,
    required this.color,
    required this.title,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(imageAsset, width: 40, height: 40),
          SizedBox(width: size.width * 0.02),
          Text(
            title,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
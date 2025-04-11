import 'package:flutter/material.dart';

class RoundedImageCard extends StatelessWidget {
  final String asset;
  const RoundedImageCard({super.key, required this.asset});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height * 0.0147),
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
        height: height * 0.20588,
        width: width * 0.28,
      ),
    );
  }
}

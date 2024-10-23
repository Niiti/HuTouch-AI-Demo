import 'package:flutter/material.dart';

class StatsButton extends StatelessWidget {
  final String iconAsset;
  final String label;
  final VoidCallback onTap;

  StatsButton({required this.iconAsset, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(iconAsset, width: 24, height: 24, color: Colors.white.withOpacity(0.75)),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5))),
        ],
      ),
    );
  }
}
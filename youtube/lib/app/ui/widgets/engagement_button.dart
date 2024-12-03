import 'package:flutter/material.dart';

class EngagementButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconSize;
  final VoidCallback onTap;

  const EngagementButton({
    required this.icon,
    required this.label,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon, color: Colors.white),
            iconSize: iconSize,
            onPressed: onTap,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

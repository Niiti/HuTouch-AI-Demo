// File: lib/widgets/circular_button.dart

import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final Color shadowColor;
  final VoidCallback onPressed;

  CircularButton({
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.shadowColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 40,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor, size: 28),
        onPressed: onPressed,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final String iconPath;

  ActionIcon({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.4),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 20,
          height: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

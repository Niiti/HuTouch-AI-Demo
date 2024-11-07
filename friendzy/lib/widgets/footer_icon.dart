import 'package:flutter/material.dart';
import '../constants/constants.dart';

class FooterIcon extends StatelessWidget {
  final String iconAsset;
  final bool isActive;
  final VoidCallback onTap;

  FooterIcon(
      {required this.iconAsset, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? primaryColor : Colors.transparent,
        ),
        child: Center(
          child: Image.asset(
            iconAsset,
            width: 24,
            height: 24,
            color: isActive ? Colors.white : textColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

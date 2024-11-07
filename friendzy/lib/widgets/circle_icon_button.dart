// lib/widgets/circle_icon_button.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class CircleIconButton extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onPressed;

  CircleIconButton({required this.iconAsset, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: kTextColor,
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Image.asset(
          iconAsset,
          width: 24,
          height: 24,
          color: kTextColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

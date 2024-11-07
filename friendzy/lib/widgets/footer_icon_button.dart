// lib/widgets/footer_icon_button.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';

class FooterIconButton extends StatelessWidget {
  final String iconAsset;
  final bool isSelected;
  final VoidCallback onPressed;

  FooterIconButton({
    required this.iconAsset,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isSelected ? 1.0 : 0.5,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 62,
          height: 48,
          child: Center(
            child: Image.asset(
              iconAsset,
              width: 24,
              height: 24,
              color: isSelected ? kAccentColor : kTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

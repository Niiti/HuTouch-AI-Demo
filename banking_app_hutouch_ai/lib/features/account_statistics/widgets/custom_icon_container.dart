import 'package:flutter/material.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';

class CustomIconContainer extends StatelessWidget {
  final Widget child;
  const CustomIconContainer({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Center(child: child),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  const CustomHeader({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: TextStyle(
        fontSize: screenHeight * 0.027,
        fontWeight: FontWeight.w600,
        fontFamily: 'Gilroy',
        color: ColorPalette.textPrimary,
      ),
    );
  }
}

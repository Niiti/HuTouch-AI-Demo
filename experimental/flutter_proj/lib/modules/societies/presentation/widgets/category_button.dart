/* SELECTED CODE START */
/* SELECTED CODE START */
// Updated code by Hutouch
import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  const CategoryButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.all(width * 0.015), // Increased width padding
      decoration: BoxDecoration(
        color: ColorPalette.categoryBackground,
        borderRadius: BorderRadius.circular(height * 0.02),
      ),
      constraints: BoxConstraints(
        minHeight: height * 0.06, // Increased minimum height
        minWidth: width * 0.45, // Increased minimum width
      ),
      child: Center(
        child: Text(
          label,
          maxLines: 1, // Ensure text fits in the container by limiting to a single line
          overflow: TextOverflow.ellipsis, // Add ellipsis for fitting text
          style: TextStyle(
            color: ColorPalette.onSurface,
            fontSize: height * 0.015,
          ),
        ),
      ),
    );
  }
}
/* SELECTED CODE END */
/* SELECTED CODE END */
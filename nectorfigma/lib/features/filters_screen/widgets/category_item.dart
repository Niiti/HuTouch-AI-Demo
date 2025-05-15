import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final bool selected;
  final double screenHeight;
  final String? asset;
  final ValueChanged<bool?> onChanged;
  const CategoryItem({
    super.key,
    required this.label,
    required this.selected,
    required this.screenHeight,
    this.asset,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: Row(
        children: [
          Checkbox(
            value: selected,
            onChanged: onChanged,
            activeColor: ColorPalette.primary,
          ),
          if (asset != null) ...[
            Image.asset(
              asset!,
              width: screenHeight * 0.03,
              height: screenHeight * 0.03,
            ),
            SizedBox(width: screenHeight * 0.01),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.018,
              fontWeight: FontWeight.w500,
              fontFamily: 'Gilroy',
              color: selected ? ColorPalette.primary : ColorPalette.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

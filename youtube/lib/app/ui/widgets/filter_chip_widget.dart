import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isActive;
  final double? width;

  const FilterChipWidget({
    required Key key,
    required this.label,
    this.isActive = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: AppConstants.choiceChipFontSize,
          color: isActive ? Colors.white : Colors.black,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      selected: isActive,
      onSelected: (bool selected) {},
      selectedColor: AppConstants.selectedChoiceChipColor,
      backgroundColor: AppConstants.unselectedChoiceChipColor,
    );
  }
}

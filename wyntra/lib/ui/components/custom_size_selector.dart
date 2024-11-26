import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class CustomSizeSelector extends StatefulWidget {
  final List<String> sizes;
  final Function(String) onSelected;

  CustomSizeSelector({required this.sizes, required this.onSelected});

  @override
  _CustomSizeSelectorState createState() => _CustomSizeSelectorState();
}

class _CustomSizeSelectorState extends State<CustomSizeSelector> {
  String selectedSize = '';

  @override
  void initState() {
    super.initState();
    selectedSize = widget.sizes.last;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes.map((size) {
        bool isSelected = size == selectedSize;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
            widget.onSelected(size);
          },
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFFFFD2ED) : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              size,
              style: isSelected
                  ? AppStyles.selectedSizeTextStyle
                  : AppStyles.sizeTextStyle,
            ),
          ),
        );
      }).toList(),
    );
  }
}
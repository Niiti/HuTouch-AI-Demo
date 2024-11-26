import 'package:flutter/material.dart';
import '../constants/constants.dart';

class TabButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  TabButton({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  offset: Offset(0, 3),
                  blurRadius: 1,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  offset: Offset(0, 3),
                  blurRadius: 8,
                ),
              ]
            : [],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'Hellix',
            height: 19.6 / 14,
          ),
        ),
      ),
    );
  }
}

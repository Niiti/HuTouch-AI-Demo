import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final String iconAsset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const BottomNavItem({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenHeight * 0.05,
            height: screenHeight * 0.05,
            child: Image.asset(iconAsset, fit: BoxFit.cover),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

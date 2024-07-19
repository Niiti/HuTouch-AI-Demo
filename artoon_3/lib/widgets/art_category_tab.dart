import 'package:flutter/material.dart';

class ArtCategoryTab extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  ArtCategoryTab(
      {required this.category, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        category,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.blue : Colors.black),
      ),
    );
  }
}

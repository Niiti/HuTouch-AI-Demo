// lib/widgets/footer_section.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'footer_icon_button.dart';
import 'footer_add_button.dart';

class FooterSection extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  FooterSection({required this.currentIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          kDefaultShadow,
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FooterIconButton(
            iconAsset: 'assets/home.png',
            isSelected: currentIndex == 0,
            onPressed: () => onTabSelected(0),
          ),
          FooterAddButton(
            onPressed: () => onTabSelected(2),
          ),
          FooterIconButton(
            iconAsset: 'assets/compass_icon.png',
            isSelected: currentIndex == 1,
            onPressed: () => onTabSelected(1),
          ),
        ],
      ),
    );
  }
}

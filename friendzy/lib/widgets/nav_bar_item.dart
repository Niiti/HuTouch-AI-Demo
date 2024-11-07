import 'package:flutter/material.dart';
import '../constants/constants.dart';

class NavBarItem extends StatelessWidget {
  final int index;
  final String iconPath;
  final bool isSelected;
  final bool isProfile;
  final ValueChanged<int> onTap;

  NavBarItem({
    required this.index,
    required this.iconPath,
    required this.isSelected,
    this.isProfile = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 62,
        height: 48,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kAccentColor.withOpacity(1),
                    shape: BoxShape.circle,
                  ),
                ),
              isProfile
                  ? CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage(iconPath),
                    )
                  : Image.asset(
                      iconPath,
                      width: 24,
                      height: 24,
                      color: isSelected
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : kPrimaryColor.withOpacity(0.5),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

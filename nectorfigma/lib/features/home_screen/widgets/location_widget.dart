import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';

class LocationWidget extends StatelessWidget {
  final VoidCallback onTap;
  const LocationWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, color: Colors.black),
          SizedBox(width: size.width * 0.02),
          Text(
            AppStrings.homeLocation,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w600,
              color: ColorPalette.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meditate/core/constants/app_colors.dart';

class NarratorOption extends StatelessWidget {
  final String title;
  final String duration;
  final bool isSelected;

  const NarratorOption({
    required this.title,
    required this.duration,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Row(
        children: [
          Container(
            width: width * 0.1,
            height: width * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.accent : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.transparent : AppColors.secondary,
              ),
            ),
            child: Icon(
              Icons.play_arrow,
              color: isSelected ? AppColors.white : AppColors.secondary,
            ),
          ),
          SizedBox(width: width * 0.05),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.045,
                  color: AppColors.primary,
                ),
              ),
              Text(
                duration,
                style: TextStyle(
                  fontSize: width * 0.035,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

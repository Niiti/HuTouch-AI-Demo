
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';

class ReviewCardWidget extends StatelessWidget {
  final String reviewerName;
  final String reviewText;
  final String timeAgo;
  final String imageAsset;
  const ReviewCardWidget({
    required this.reviewerName,
    required this.reviewText,
    required this.timeAgo,
    required this.imageAsset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      padding: EdgeInsets.all(size.width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(size.height * 0.005),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              imageAsset,
              width: size.width * 0.15,
              height: size.width * 0.15,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
            ),
          ),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row( // Added Row for name and time alignment
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns text to the extreme ends
                  children: [
                    Text(
                      reviewerName,
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text( // Moved timeAgo here to align right of name
                      timeAgo,
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        color: AppColors.hintText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.005),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: AppColors.secondary,
                      size: size.height * 0.02,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.005),
                Text(
                  reviewText,
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

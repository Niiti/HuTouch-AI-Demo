import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';

class ProductHeaderWidget extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final double screenWidth;

  ProductHeaderWidget({
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: screenWidth * 0.06,
          ),
          Text(
            'Detail',
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Image.asset(
              isFavorite
                  ? AppConstants.heartIcon // Replace with your filled heart asset path
                  : AppConstants.heartIcon, // Replace with your outline heart asset path
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: onFavoriteToggle,
            iconSize: screenWidth * 0.06,
          ),
        ],
      ),
    );
  }
}

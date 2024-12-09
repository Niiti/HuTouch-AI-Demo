import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/coffee.dart';

class CoffeeCard extends StatelessWidget {
  final double width;
  final double height;
  final Coffee coffee;
  final VoidCallback onAddToCart;

  CoffeeCard({
    required this.width,
    required this.height,
    required this.coffee,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width * 0.05),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start, // Avoid pushing content out
          children: [
            Stack(
              children: [
                // Image with fixed aspect ratio
                AspectRatio(
                  aspectRatio: 4 / 3, // Maintains a consistent ratio
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width * 0.05),
                    child: Image.asset(
                      coffee.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: width * 0.02,
                  right: width * 0.02,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF111111), Color(0xFF303030)],
                      ),
                      borderRadius: BorderRadius.circular(width * 0.05),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02,
                      vertical: width * 0.005, // Use width for padding consistency
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppConstants.starIcon,
                          color: Color(0xFFFABD21),
                          width: width * 0.035,
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          '${coffee.rating}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.03, // Adaptive font size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            // Coffee Name
            Text(
              coffee.name,
              maxLines: 1, // Prevent overflow
              overflow: TextOverflow.ellipsis, // Adds "..." for overflow
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.04, // Adaptive font size
              ),
            ),
            // Coffee Description
            Text(
              coffee.description,
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontSize: width * 0.035, // Adaptive font size
              ),
            ),
            SizedBox(height: height * 0.01),
            // Price and Add-to-Cart Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${coffee.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: onAddToCart,
                  child: Container(
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      color: Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: width * 0.05, // Adaptive icon size
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

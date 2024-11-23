import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_colors.dart';
import '../pages/custom_product_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onFavorite;

  ProductCard({
    required this.product,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: GestureDetector(

                          onTap: () {
                    // Navigate to additional trending products
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomProductPage(),
                      ),
                    );
                  },

        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image and Favorite Icon
              Stack(
                children: [
                  Image.asset(
                    product.imagePath,
                    height: 136,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: GestureDetector(
                      onTap: onFavorite,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Category
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                child: Text(
                  product.category,
                  style: AppStyles.productCategoryStyle,
                ),
              ),
              // Product Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.productName,
                  maxLines: 2,
                  style: AppStyles.productNameStyle,
                ),
              ),
              SizedBox(height: 4),
              // Rating and Reviews
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.starColor,
                      size: 10,
                    ),
                    SizedBox(width: 4),
                    Text(
                      product.rating,
                      style: AppStyles.ratingStyle,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '|',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 6,
                        fontWeight: FontWeight.w500,
                        color: AppColors.dividerColor,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      product.reviews,
                      style: AppStyles.ratingStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              // Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  product.price,
                  style: AppStyles.priceStyle,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../constants/app_constants.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      margin: EdgeInsets.only(right: 12.0, left: 12.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 124.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(6.0)),
              image: DecorationImage(
                image: NetworkImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          // Name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                fontFamily: 'Montserrat',
                color: AppColors.blackColor,
              ),
            ),
          ),
          SizedBox(height: 4.0),
          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.description,
              style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'Montserrat',
                color: AppColors.blackColor,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          // Price and Discount
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  product.price,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  product.oldPrice,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Montserrat',
                    color: Color(0xFF808285),
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  product.discount,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontFamily: 'Montserrat',
                    color: AppColors.redColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.0),
          // Rating
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                ...List.generate(5, (index) {
                  if (index < product.rating.floor()) {
                    return Icon(Icons.star,
                        size: 14.0, color: AppColors.amberColor);
                  } else if (index + 0.5 == product.rating) {
                    return Icon(Icons.star_half,
                        size: 14.0, color: AppColors.amberColor);
                  } else {
                    return Icon(Icons.star_border,
                        size: 14.0, color: AppColors.greyColor);
                  }
                }),
                SizedBox(width: 4.0),
                Text(
                  product.ratingCount,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontFamily: 'Montserrat',
                    color: Color(0xFFA4A9B3),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
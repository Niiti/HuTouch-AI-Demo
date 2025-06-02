import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';

class ServiceCardWidget extends StatelessWidget {
  final String serviceName;
  final String price;
  final String duration;
  final String discount;
  final String imageAsset;
  final String description;

  const ServiceCardWidget({
    required this.serviceName,
    required this.price,
    required this.duration,
    required this.discount,
    required this.imageAsset,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(size.height * 0.005)),
            child: Image.asset(
              imageAsset,
              width: size.width * 0.3,
              height: size.height * 0.15,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  // SizedBox(height: size.height * 0.005),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      if (discount.isNotEmpty)
                        SizedBox(width: size.width * 0.02),
                      Text(
                        discount,
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  
                  Expanded(
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/features/favorites_screen/models/product_model.dart';
import 'package:nectorfigma/features/favorites_screen/views/product_detail_page.dart';

class ProductRow extends StatelessWidget {
  final ProductModel model;
  const ProductRow({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Get.to(() => const ProductDetailPage()),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        child: Row(
          children: [
            Image.asset(
              model.imageAsset,
              width: size.width * 0.15,
              fit: BoxFit.cover,
            ),
            SizedBox(width: size.width * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontFamily: 'Gilroy-Bold',
                      color: ColorPalette.onBackground,
                    ),
                  ),
                  Text(
                    model.subText,
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontFamily: 'Gilroy-Medium',
                      color: ColorPalette.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$${model.price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gilroy',
                color: ColorPalette.onBackground,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

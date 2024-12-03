import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/responsive_util.dart';
import '../../../data/app_constants.dart';

class AddToCartButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = ResponsiveUtil.getHeight(context);
    final width = ResponsiveUtil.getWidth(context);

    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Success',
          'Ingredients added to cart',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.1,
        ),
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
        ),
        decoration: BoxDecoration(
          color: AppConstants.primaryColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Center(
          child: Text(
            "Add To Cart",
            style: TextStyle(
              fontFamily: 'Sofia Pro',
              fontWeight: FontWeight.w800,
              fontSize: width * 0.045,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

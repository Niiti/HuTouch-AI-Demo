import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/controllers/shop_details_controller.dart';

class AboutSectionWidget extends GetView<ShopDetailsController> {
  const AboutSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.015,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.aboutTitle,
            style: TextStyle(
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Obx(
            () => Text(
              controller.isDescriptionExpanded.value
                  ? AppStrings.aboutDescription
                  : '${AppStrings.aboutDescription.substring(0, 100)}...',
              style: TextStyle(
                fontSize: size.height * 0.018,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.toggleDescription,
            child: Text(
              AppStrings.readMore,
              style: TextStyle(
                fontSize: size.height * 0.018,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/interest_section.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/controllers/shop_details_controller.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/service_card_widget.dart';

import '../../home_screen/widgets/offers_section.dart';

class ServicesSectionWidget extends GetView<ShopDetailsController> {
  const ServicesSectionWidget({Key? key}) : super(key: key);

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
            AppStrings.ourServicesTitle,
            style: TextStyle(
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          TabPillSelector(
            options:const ['Haircut', 'Facial', 'Nails'],
            assetPaths:const [
              ImagesAsset.haircut,
              ImagesAsset.facial,
              ImagesAsset.nails,
            ],
            selectedIndex: controller.selectedCategoryIndex.value,
            onSelect: (index) => controller.selectCategory(index),
          ),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            height: size.height * 0.15, // Modified: Remove height restriction to allow vertical scroll
            child: Scrollbar(
              child:  ListView(
                  scrollDirection: Axis.horizontal, // Modified: Switch scroll direction to vertical
                  shrinkWrap: true, // Modified: Allow list to adjust to content size
                  children: const [
                    ServiceCardWidget(
                      serviceName: 'Woman Medium..',
                      price: '123',
                      duration: '2 hour',
                      discount: '-20%',
                      imageAsset: ImagesAsset.womenMedium,
                      description: "Woman Medium.. Description",
                    ),
                    ServiceCardWidget(
                      serviceName: 'Bob/ Lob Cut',
                      price: '456',
                      duration: '1,5 hour',
                      discount: '-20%',
                      imageAsset: ImagesAsset.bobLobCut,
                      description: "Woman Medium.. Description",
                    ),
                    ServiceCardWidget(
                      serviceName: 'Medium Length Layer Cut',
                      price: '1512',
                      duration: '1 hour',
                      discount: '',
                      imageAsset: ImagesAsset.mediumLayer,
                      description: "Woman Medium.. Description",
                    ),
                    ServiceCardWidget(
                      serviceName: 'V-Shaped Cut',
                      price: '546',
                      duration: '2,5 hour',
                      discount: '-5%',
                      imageAsset: ImagesAsset.vShaped,
                      description: "Woman Medium.. Description",
                    ),
                  ],
                ),
              ),

          ),
          SizedBox(height: size.height * 0.03),
          Center(
            child: SecondaryButtonOutlined(
              text: AppStrings.viewAllServices,
              onPressed: () {},
              borderColor: AppColors.primary,
              textColor: AppColors.primary,
              icon: null,
            ),
          ),
        ],
      ),
    );
  }
}
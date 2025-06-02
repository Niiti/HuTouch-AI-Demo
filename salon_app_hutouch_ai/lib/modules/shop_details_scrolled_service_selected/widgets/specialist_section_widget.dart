import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/specialist_card_widget.dart';

class SpecialistSectionWidget extends StatelessWidget {
  const SpecialistSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
      )+EdgeInsets.only(top: size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.ourSpecialistsTitle,
                style: TextStyle(
                  fontSize: size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppStrings.viewAll,
                style: TextStyle(
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          SizedBox(
            height: size.height * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SpecialistCardWidget(
                  name: 'Ronald',
                  imageAsset: ImagesAsset.specialist1,
                ),
                SpecialistCardWidget(
                  name: 'Merry',
                  imageAsset: ImagesAsset.specialist2,
                ),
                SpecialistCardWidget(
                  name: 'Bella',
                  imageAsset: ImagesAsset.specialist3,
                ),
                SpecialistCardWidget(
                  name: 'Joseph',
                  imageAsset: ImagesAsset.specialist4,
                ),
                SpecialistCardWidget(
                  name: 'Samantha',
                  imageAsset: ImagesAsset.specialist5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

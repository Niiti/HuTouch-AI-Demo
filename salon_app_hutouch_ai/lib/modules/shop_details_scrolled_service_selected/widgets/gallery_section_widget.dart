import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/gallery_image_widget.dart';

class GallerySectionWidget extends StatelessWidget {
  const GallerySectionWidget({Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.galleryTitle,
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
            // height: size.height * 0.22,
            height:140,
            child: Scrollbar(
              child: ListView(

                scrollDirection: Axis.horizontal,
                children: const [
                  GalleryImageWidget(imageAsset: ImagesAsset.gallery1),
                  GalleryImageWidget(imageAsset: ImagesAsset.gallery2),
                  GalleryImageWidget(imageAsset: ImagesAsset.gallery3),
                  GalleryImageWidget(imageAsset: ImagesAsset.gallery4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

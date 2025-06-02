/* SELECTED CODE START */
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/core/constants/color_palette.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/primary_button.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.015,
      ),
      child: Column(
        children: [

          SizedBox(height: size.height * 0.015),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.total,
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.serviceCount,
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '~24  ',
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextSpan(
                          text: "34",
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            color: AppColors.textPrimary,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              IconButton(
                icon: Image.asset(
                  height: 46,
                  width: 46,
                  ImagesAsset.messageIcon,
                  errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
                ),
                iconSize: size.height * 0.04,
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(width: size.width * 0.03),
              Expanded(
                child: PrimaryButton(

                  onPressed: () {},
                  text: AppStrings.bookNow,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/* SELECTED CODE END */
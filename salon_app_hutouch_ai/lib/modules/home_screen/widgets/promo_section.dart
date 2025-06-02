 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/views/offer_details_page.dart';
import 'package:get/get.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/views/shop_details_scrolled_service_selected_view.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final padding = width * 0.04;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height * 0.02),
        child: Stack(
          children: [
            Image.asset(
              ImagesAsset.bannerBackground,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: padding,
              top: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.lookMoreBeautiful,
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.manrope,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => const OfferDetailsPage()),
                      // );
                      Get.to(const ShopDetailsScrolledServiceSelectedView());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: padding * 0.5, vertical: padding * 0.2),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 248, 229, 1),
                        borderRadius: BorderRadius.circular(height * 0.02),
                      ),
                      child: Text(
                        AppStrings.getOfferNow,
                        style: TextStyle(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.bold,
                          fontFamily: Fonts.manrope,
                          color: const Color.fromRGBO(248, 134, 0, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: padding,
              top: padding,
              child: Column(
                children: [
                  Text(
                    AppStrings.upTo,
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.manrope,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '50%',
                    style: TextStyle(
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.manrope,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 

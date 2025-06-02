 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/views/all_nearby_offers_page.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/offer_card.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final padding = width * 0.04;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.nearbyOffersTitle,
                style: TextStyle(
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.manrope,
                  color: const Color.fromRGBO(17, 17, 17, 1),
                ),
              ),
              SecondaryButtonOutlined(
                text: AppStrings.viewAll,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AllNearbyOffersPage()),
                  );
                },
                borderColor: const Color.fromRGBO(21, 103, 120, 1),
                textColor: const Color.fromRGBO(21, 103, 120, 1),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height * 0.20,
            child: Scrollbar(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  OfferCard(
                    imagePath: ImagesAsset.nearbySalon1,
                    salonName: 'Sophisticated Salon',
                    services: 'Hair . Facial',
                    location: '360 Stillwater Rd. Palm City..',
                    rating: '4.7',
                    ratingCount: '(2.7k)',
                    discount: '-58%',
                  ),
                  SizedBox(width: 16),
                  OfferCard(
                    imagePath: ImagesAsset.nearbySalon2,
                    salonName: 'Plush Beauty Lounge',
                    services: 'Hair . Facial',
                    location: '2607 Haymond Rocks ..',
                    rating: '4.8',
                    ratingCount: '(3.1k)',
                    discount: '-58%',
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

class SecondaryButtonOutlined extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color textColor;
  final Widget? icon;

  const SecondaryButtonOutlined({
    Key? key,
    required this.text,
    this.onPressed,
    required this.borderColor,
    required this.textColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.height * 0.020;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 8)],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontFamily: Fonts.manrope,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
 

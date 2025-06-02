 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/views/offer_details_page.dart';

class OfferCard extends StatelessWidget {
  final String imagePath;
  final String salonName;
  final String services;
  final String location;
  final String rating;
  final String ratingCount;
  final String discount;

  const OfferCard({
    super.key,
    required this.imagePath,
    required this.salonName,
    required this.services,
    required this.location,
    required this.rating,
    required this.ratingCount,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width * 0.85;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const OfferDetailsPage()),
        );
      },
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 8)],
          borderRadius: BorderRadius.circular(cardWidth * 0.02),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(cardWidth * 0.02)),
              child: Image.asset(
                imagePath,
                width: cardWidth * 0.4,
                height: cardWidth * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(cardWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImagesAsset.starIcon,
                          color: const Color.fromRGBO(248, 134, 0, 1),
                          width: cardWidth * 0.05,
                        ),
                        SizedBox(width: cardWidth * 0.01),
                        Text(
                          rating,
                          style: TextStyle(
                            fontSize: cardWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.manrope,
                            color: const Color.fromRGBO(17, 17, 17, 1),
                          ),
                        ),
                        SizedBox(width: cardWidth * 0.01),
                        Text(
                          ratingCount,
                          style: TextStyle(
                            fontSize: cardWidth * 0.035,
                            fontWeight: FontWeight.normal,
                            fontFamily: Fonts.nunitoSans,
                            color: const Color.fromRGBO(17, 17, 17, 1),
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          ImagesAsset.heartIcon,
                          color: const Color.fromRGBO(237, 76, 92, 1),
                          width: cardWidth * 0.06,
                        ),
                      ],
                    ),
                    SizedBox(height: cardWidth * 0.02),
                    Text(
                      salonName,
                      style: TextStyle(
                        fontSize: cardWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        fontFamily: Fonts.manrope,
                        color: const Color.fromRGBO(17, 17, 17, 1),
                      ),
                    ),
                    SizedBox(height: cardWidth * 0.01),
                    Text(
                      services,
                      style: TextStyle(
                        fontSize: cardWidth * 0.035,
                        fontWeight: FontWeight.normal,
                        fontFamily: Fonts.nunitoSans,
                        color: const Color.fromRGBO(21, 103, 120, 1),
                      ),
                    ),
                    SizedBox(height: cardWidth * 0.01),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: cardWidth * 0.035,
                        fontWeight: FontWeight.normal,
                        fontFamily: Fonts.nunitoSans,
                        color: const Color.fromRGBO(80, 85, 92, 1),
                      ),
                    ),
                    SizedBox(height: cardWidth * 0.01),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.02, vertical: cardWidth * 0.005),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 248, 229, 1),
                            borderRadius: BorderRadius.circular(cardWidth * 0.02),
                          ),
                          child: Text(
                            AppStrings.distanceOne,
                            style: TextStyle(
                              fontSize: cardWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              fontFamily: Fonts.manrope,
                              color: const Color.fromRGBO(248, 134, 0, 1),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          discount,
                          style: TextStyle(
                            fontSize: cardWidth * 0.035,
                            fontWeight: FontWeight.bold,
                            fontFamily: Fonts.nunitoSans,
                            color: const Color.fromRGBO(248, 134, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 

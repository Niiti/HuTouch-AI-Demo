import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/controllers/home_controller.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/featured_salon_card.dart';

class FeaturedSalonSection extends StatelessWidget {
  const FeaturedSalonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
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
                AppStrings.featuredSalonTitle,
                style: TextStyle(
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.bold,
                  fontFamily: Fonts.manrope,
                  color: const Color.fromRGBO(17, 17, 17, 1),
                ),
              ),
              // Optional 'View All' functionality can stay here
            ],
          ),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height * 0.28,
            child: Obx(() {
              if (controller.featuredSalons.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.featuredSalons.length,
                  itemBuilder: (context, index) {
                    final salon = controller.featuredSalons[index];
                    return FeaturedSalonCard(
                      imagePath: salon.image,
                      salonName: salon.title,
                      services: salon.content,
                      location: salon.address,
                      rating: salon.rating.toString(),
                      ratingCount: '(${salon.likeCount})',
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
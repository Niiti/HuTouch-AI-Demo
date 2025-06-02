 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/controllers/home_controller.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/bottom_nav_bar_section.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/categories_section.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/featured_salon_section.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/header_section.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/interest_section.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/offers_section.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/promo_section.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/salon_follow_section.dart';

class HomepageFull extends StatelessWidget {
  const HomepageFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            HeaderSection(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PromoSection(),
                    CategoriesSection(),
                    SalonFollowSection(),
                    FeaturedSalonSection(),
                    InterestSection(),
                    OffersSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarSection(),
    );
  }
}
 

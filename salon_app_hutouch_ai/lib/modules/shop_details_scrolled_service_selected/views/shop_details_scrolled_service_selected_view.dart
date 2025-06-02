import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/about_section_widget.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/bottom_bar_widget.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/gallery_section_widget.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/opening_hours_widget.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/review_section_widget.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/services_section_widget.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/shop_header_widget.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/widgets/specialist_section_widget.dart';

class ShopDetailsScrolledServiceSelectedView extends StatefulWidget {
  const ShopDetailsScrolledServiceSelectedView({super.key});

  @override
  State<ShopDetailsScrolledServiceSelectedView> createState() => _ShopDetailsScrolledServiceSelectedViewState();
}

class _ShopDetailsScrolledServiceSelectedViewState extends State<ShopDetailsScrolledServiceSelectedView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShopHeaderWidget(),
              AboutSectionWidget(),
              OpeningHoursWidget(),
              ServicesSectionWidget(),
              GallerySectionWidget(),
              SpecialistSectionWidget(),
              ReviewSectionWidget(),
              BottomBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

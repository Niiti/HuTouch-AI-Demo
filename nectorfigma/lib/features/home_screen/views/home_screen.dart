import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';
import 'package:nectorfigma/features/home_screen/controllers/home_controller.dart';
import 'package:nectorfigma/features/home_screen/widgets/banner_section.dart';
import 'package:nectorfigma/features/home_screen/widgets/bottom_navbar_section.dart';
import 'package:nectorfigma/features/home_screen/widgets/category_row.dart';
import 'package:nectorfigma/features/home_screen/widgets/custom_search_widget.dart';
import 'package:nectorfigma/features/home_screen/widgets/location_widget.dart';
import 'package:nectorfigma/features/home_screen/widgets/product_card.dart';
import 'package:nectorfigma/features/home_screen/widgets/product_row.dart';
import 'package:nectorfigma/features/home_screen/widgets/section_header.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.04;

    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocationWidget(onTap: controller.showLocationDialog),
                  SizedBox(height: size.height * 0.02),
                  CustomSearchWidget(onChanged: controller.searchItems),
                  SizedBox(height: size.height * 0.02),
                  Obx(
                    () => BannerSection(
                      banners: controller.banners,
                      currentIndex: controller.currentBannerIndex.value,
                      onPageChanged: controller.updateBannerIndex,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SectionHeader(
                    title: AppStrings.exclusiveOffer,
                    onSeeAll: controller.seeAllExclusiveOffers,
                  ),
                  SizedBox(height: size.height * 0.01),
                  ProductRow(
                    products: [
                      ProductCard(
                        imageAsset: ImagesAsset.banana,
                        title: AppStrings.organicBananas,
                        subtitle: AppStrings.bananasSubtitle,
                        price: '\$4.99',
                        onAddToCart:
                            () =>
                                controller.addToCart(AppStrings.organicBananas),
                      ),
                      ProductCard(
                        imageAsset: ImagesAsset.apple,
                        title: AppStrings.redApple,
                        subtitle: AppStrings.appleSubtitle,
                        price: '\$4.99',
                        onAddToCart:
                            () => controller.addToCart(AppStrings.redApple),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  SectionHeader(
                    title: AppStrings.bestSelling,
                    onSeeAll: controller.seeAllBestSelling,
                  ),
                  SizedBox(height: size.height * 0.01),
                  ProductRow(
                    products: [
                      ProductCard(
                        imageAsset: ImagesAsset.pepper,
                        title: AppStrings.bellPepper,
                        subtitle: AppStrings.bellPepperSubtitle,
                        price: '\$4.99',
                        onAddToCart:
                            () => controller.addToCart(AppStrings.bellPepper),
                      ),
                      ProductCard(
                        imageAsset: ImagesAsset.ginger,
                        title: AppStrings.ginger,
                        subtitle: AppStrings.gingerSubtitle,
                        price: '\$4.99',
                        onAddToCart:
                            () => controller.addToCart(AppStrings.ginger),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  SectionHeader(title: AppStrings.groceries),
                  SizedBox(height: size.height * 0.01),
                  const CategoryRow(),
                  SizedBox(height: size.height * 0.02),
                  ProductRow(
                    products: [
                      ProductCard(
                        imageAsset: ImagesAsset.beefBone,
                        title: AppStrings.beefBone,
                        subtitle: AppStrings.beefBoneSubtitle,
                        price: '\$4.99',
                        onAddToCart:
                            () => controller.addToCart(AppStrings.beefBone),
                      ),
                      ProductCard(
                        imageAsset: ImagesAsset.chicken,
                        title: AppStrings.broilerChicken,
                        subtitle: AppStrings.broilerChickenSubtitle,
                        price: '\$4.99',
                        onAddToCart:
                            () =>
                                controller.addToCart(AppStrings.broilerChicken),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBarSection(
          currentIndex: controller.selectedTabIndex.value,
          onTabChanged: controller.onTabChanged,
        ),
      ),
    );
  }
}

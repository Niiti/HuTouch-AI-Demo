import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/features/home_screen/widgets/bottom_navbar_section.dart';
import 'package:nectorfigma/features/favorites_screen/controllers/favorites_controller.dart';
import 'package:nectorfigma/features/favorites_screen/widgets/product_row.dart';
import 'package:nectorfigma/features/favorites_screen/widgets/add_to_cart_button.dart';

class FavoritesScreen extends GetView<FavoritesController> {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.background,
      appBar: AppBar(
        backgroundColor: ColorPalette.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.favoritesTitle,
          style: TextStyle(
            fontSize: size.height * 0.03,
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.bold, // Bold title
            color: ColorPalette.onBackground,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(color: ColorPalette.divider, thickness: 1),
          Expanded(
            child: Obx(
              () => Scrollbar(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  itemCount: controller.favorites.length,
                  itemBuilder: (context, index) {
                    final item = controller.favorites[index];
                    return ProductRow(model: item);
                  },
                  separatorBuilder:
                      (_, __) => const Divider(
                        color: ColorPalette.divider,
                        thickness: 1,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          AddToCartButton(
            text: AppStrings.addAllToCart,
            onPressed: controller.addAllToCart,
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarSection(
        currentIndex: 3,
        onTabChanged: (index) {},
      ),
    );
  }
}

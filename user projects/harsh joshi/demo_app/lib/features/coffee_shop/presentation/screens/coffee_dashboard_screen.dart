// lib/features/coffee_shop/presentation/screens/coffee_dashboard_screen.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/color_palette.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/category_tabs_widget.dart';
import '../widgets/location_selector_widget.dart';
import '../widgets/promo_banner_widget.dart';
import '../widgets/product_grid_widget.dart';

class CoffeeDashboardScreen extends StatelessWidget {
  const CoffeeDashboardScreen({Key? key}) : super(key: key);

  final Gradient gradientBackground = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(25, 25, 25, 1), Color.fromRGBO(48, 48, 48, 1)],
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalette.darkGrey,
        body: Container(
          decoration: BoxDecoration(gradient: gradientBackground),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      LocationSelectorWidget(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      PromoBannerWidget(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const CategoryTabsWidget(),
                      SizedBox(height: screenHeight * 0.02),
                      const ProductGridWidget(),
                    ],
                  ),
                ),
              ),
              const BottomNavBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

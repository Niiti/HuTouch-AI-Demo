// lib/features/coffee_shop/presentation/screens/coffee_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/color_palette.dart';
import '../../../../core/constants/theme_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../coffee_shop/domain/blocs/coffee_bloc.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/category_tabs_widget.dart';
import '../widgets/location_selector_widget.dart';
import '../widgets/promo_banner_widget.dart';
import '../widgets/product_grid_widget.dart';

class CoffeeDashboardScreen extends StatefulWidget {
  const CoffeeDashboardScreen({Key? key}) : super(key: key);

  @override
  _CoffeeDashboardScreenState createState() => _CoffeeDashboardScreenState();
}

class _CoffeeDashboardScreenState extends State<CoffeeDashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoffeeBloc>().add(LoadCoffeeProducts());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: BodyContent()),
              BottomNavBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    Key? key,
  }) : super(key: key);

  final Gradient gradientBackground = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(25, 25, 25, 1),
      Color.fromRGBO(48, 48, 48, 1)
    ],
  );

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: gradientBackground,
      ),
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
            CategoryTabsWidget(),
            SizedBox(height: screenHeight * 0.02),
            ProductGridWidget(),
          ],
        ),
      ),
    );
  }
}

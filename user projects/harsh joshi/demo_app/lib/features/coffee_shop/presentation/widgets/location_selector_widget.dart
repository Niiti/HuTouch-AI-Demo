// lib/features/coffee_shop/presentation/widgets/location_selector_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/color_palette.dart';
import '../../../../core/constants/theme_constants.dart';
import '../bloc/coffee_bloc.dart';

class LocationSelectorWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const LocationSelectorWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location', style: ThemeConstants.locationText),
          Row(
            children: [
              Text('Bilzen, Tanjungbalai', style: ThemeConstants.locationDetailText),
              SizedBox(width: screenWidth * 0.01),
              Icon(Icons.keyboard_arrow_down, color: ColorPalette.white, size: screenWidth * 0.04),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    color: ColorPalette.darkGrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: ColorPalette.grey, size: screenWidth * 0.05),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search coffee',
                            hintStyle: TextStyle(
                              color: ColorPalette.grey,
                              fontSize: screenHeight * 0.018,
                              fontFamily: ThemeConstants.fontFamily,
                            ),
                          ),
                          style: const TextStyle(color: ColorPalette.white),
                          onChanged: (value) =>
                              context.read<CoffeeBloc>().add(SearchCoffeeProducts(value)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              Container(
                width: screenWidth * 0.12,
                height: screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: ColorPalette.brown,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.filter_list, color: ColorPalette.white, size: screenWidth * 0.05),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

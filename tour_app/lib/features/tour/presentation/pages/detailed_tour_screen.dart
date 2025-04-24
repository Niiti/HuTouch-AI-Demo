import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/features/tour/presentation/widgets/app_header_with_profile.dart';
import 'package:my_project/features/tour/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:my_project/features/tour/presentation/widgets/info_item.dart';
import 'package:my_project/features/tour/presentation/widgets/price_book_now_section.dart';
import 'package:my_project/features/tour/presentation/widgets/thumbnail_list.dart';
import 'package:my_project/features/tour/presentation/widgets/top_image_section.dart';
import 'package:my_project/features/tour/presentation/widgets/travel_summary_header.dart';
import 'package:my_project/l10n/app_localizations.dart';

class DetailedTourScreen extends StatefulWidget {
  const DetailedTourScreen({super.key});

  @override
  State<DetailedTourScreen> createState() => _DetailedTourScreenState();
}

class _DetailedTourScreenState extends State<DetailedTourScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      // bottomNavigationBar: const BottomNavigationBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Reused AppHeaderWithProfile component at the top of the screen.
              // const AppHeaderWithProfile(),
              TopImageSection(
                pageController: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentPage == index ? 12.0 : 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.05),
                child: const ThumbnailList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: TravelSummaryHeader(screenHeight: screenHeight),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InfoItem(
                        iconPath: 'assets/images/duration_icon.png',
                        label: localizations.duration,
                        value: '5 Days',
                        screenHeight: screenHeight,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: InfoItem(
                        iconPath: 'assets/images/distance_icon.png',
                        label: localizations.distance,
                        value: '411 KM',
                        screenHeight: screenHeight,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: InfoItem(
                        iconPath: 'assets/images/ratings_icon.png',
                        label: localizations.rating,
                        value: '4.5',
                        screenHeight: screenHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    localizations.descriptionTitle,
                    style: TextStyle(
                      fontSize: screenHeight * 0.02463,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF Pro Text',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  localizations.descriptionContent,
                  style: TextStyle(
                    fontSize: screenHeight * 0.01724,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'SF Pro Text',
                    color: const Color.fromRGBO(163, 170, 191, 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.03,
                ),
                child: PriceBookNowSection(screenHeight: screenHeight),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // API client for making requests
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/features/tour/presentation/widgets/app_header_with_profile.dart';
import 'package:my_project/features/tour/presentation/widgets/search_bar.dart';
import 'package:my_project/features/tour/presentation/widgets/suggestions_carousel.dart';
import 'package:my_project/features/tour/presentation/widgets/tour_card.dart';
import 'package:my_project/features/tour/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:my_project/l10n/app_localizations.dart';

class TourLandingPage extends StatefulWidget {
  const TourLandingPage({super.key});
  @override
  _TourLandingPageState createState() => _TourLandingPageState();
}

class _TourLandingPageState extends State<TourLandingPage> {
  List<dynamic> tours = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchBestTours();
  }

  Future<void> fetchBestTours() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Performing the network call
      var response = await Dio().get(
        'https://6803759d-2bfb-4aa4-8ab1-ddc2ace685e8.mock.pstmn.io/get_best_tours',
      );
      setState(() {
        tours = response.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to fetch tours. Please try again later.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeaderWithProfile(),
              SizedBox(height: screenHeight * 0.02),
              const SearchBar(),
              SizedBox(height: screenHeight * 0.02),
              const SuggestionsCarousel(),
              SizedBox(height: screenHeight * 0.02),
              Text(
                localizations.theBestTours,
                style: TextStyle(
                  fontSize: screenHeight * 0.022,
                  color: ColorPalette.primaryText,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child:
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : tours.isEmpty
                        ? Center(
                          child: Text('No tours available at the moment'),
                        )
                        : ListView.builder(
                          itemCount: tours.length,
                          itemBuilder: (context, index) {
                            final tour = tours[index];
                            return TourCard(
                              imageAsset:
                                  tour['image_url'] ??
                                  'assets/default_image.png',
                              title: tour['title'] ?? 'No Title',
                              date: tour['date_range'] ?? 'No Date',
                              price: tour['price_per_day'].toString() ?? 'No Price',
                              location: tour['location'] ?? 'No location',
                              rating:
                                  tour['rating'] ??
                                  'No Rating', // Use a valid default or dynamic value
                            );
                          },
                        ),
              ),
              const BottomNavigationBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

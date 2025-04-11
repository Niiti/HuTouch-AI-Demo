import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/modules/home/controllers/home_controller.dart';
import 'package:my_project/modules/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:my_project/modules/home/presentation/widgets/section_scroll.dart';
import 'package:my_project/modules/home/presentation/widgets/top_banner.dart';
import 'package:my_project/modules/home/presentation/widgets/trending_section.dart';
import 'package:my_project/utils/error_handler.dart';
import 'package:my_project/modules/home/presentation/widgets/media_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    void onSearchTapped() {
      try {
        showSearch(context: context, delegate: MediaSearch());
      } catch (error) {
        ErrorHandler.showErrorMessage(message: error.toString());
      }
    }

    void onPlayNowTapped() {
      // Logic to play the featured media with error handling
      try {
        // Implement play now functionality here.
      } catch (error) {
        ErrorHandler.showErrorMessage(message: error.toString());
      }
    }

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.black,
        child: Column(
          children: [
            TopBanner(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onSearchTapped: onSearchTapped,
              onPlayNowTapped: onPlayNowTapped,
            ),
            TrendingSection(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            Obx(
              () => BottomNavBar(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                selectedIndex: controller.selectedIndex.value,
                onItemTapped: (index) => controller.onItemTapped(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

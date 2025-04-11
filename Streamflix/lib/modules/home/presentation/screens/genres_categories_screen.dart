import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/modules/home/controllers/home_controller.dart';
import 'package:my_project/modules/home/presentation/widgets/top_bar.dart';
import 'package:my_project/modules/home/presentation/widgets/content_sections.dart';
import 'package:my_project/modules/home/presentation/widgets/bottom_nav_bar.dart';

class GenresCategoriesScreen extends StatelessWidget {
  const GenresCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            Expanded(child: ContentSections()),
            Obx(
              () => BottomNavBar(
                selectedIndex: controller.selectedIndex.value,
                onItemTapped: controller.updateIndex,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

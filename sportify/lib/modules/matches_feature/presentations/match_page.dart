import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/match_controller.dart';
import '../widgets/match_body.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MatchController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Hide the default AppBar
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: MatchBody(controller: controller),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedTab.value,
          onTap: controller.changeTab,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/bottom_home_icon.png",
                height: 24,
                color: controller.selectedTab.value == 0 ? Colors.red : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/bottom_news_icon.png",
                height: 24,
                color: controller.selectedTab.value == 1 ? Colors.red : Colors.grey,
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/bottom_videos_icon.png",
                height: 24,
                color: controller.selectedTab.value == 2 ? Colors.red : Colors.grey,
              ),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/bottom_profile_icon.png",
                height: 24,
                color: controller.selectedTab.value == 3 ? Colors.red : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true, // To display labels
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed, // To keep the labels and icons fixed
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../controllers/download_screen_controller.dart';
import '../../../controllers/navigation_manager.dart';
import '../../widgets/action_button.dart';
import '../../widgets/media_card.dart';
import '../../widgets/profile_avatar.dart';

class DownloadHomeScreen extends StatelessWidget {
  final DownloadScreenController controller =
      Get.put(DownloadScreenController());
  final NavigationManager navController = Get.put(NavigationManager());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * AppConstants.paddingHorizontal,
                vertical: screenWidth * AppConstants.paddingVertical,
              ),
              child: Row(
                children: [
                  ActionButton(
                    icon: Icons.arrow_back,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Text(
                      'Downloads',
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ActionButton(
                    icon: Icons.search,
                    onPressed: () {},
                  ),
                  ActionButton(
                    icon: Icons.notifications_none,
                    onPressed: () {},
                  ),
                  ProfileAvatar(
                    radius: screenWidth * 0.05,
                    imagePath: AppConstants.profileImage,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  itemCount: controller.videoList.length,
                  itemBuilder: (context, index) {
                    return MediaCard(screenWidth: screenWidth);
                  },
                );
              }),
            ),
            Obx(() {
              return BottomNavigationBar(
                currentIndex: navController.selectedIndex.value,
                onTap: (index) => navController.changePage(index),
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.black54,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow),
                    label: 'Shorts',
                  ),
                  BottomNavigationBarItem(
                    icon: CircleAvatar(
                      radius: screenWidth * 0.05,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.subscriptions),
                    label: 'Subscription',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_library),
                    label: 'Library',
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

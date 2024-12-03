import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../controllers/main_screen_controller.dart';
import '../../../controllers/navigation_controller.dart';
import '../../widgets/menu_item_card.dart';
import '../../widgets/playlist_card.dart';
import '../../widgets/recent_video_card.dart';
import 'download_home_screen.dart';

class LibraryTab extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());
  final MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Navigation Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AppConstants.logoPath,
                        height: height * 0.04,
                      ),
                    ),
                    // Action Icons
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.cast),
                            onPressed: () {
                              // Handle cast action
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications_none),
                            onPressed: () {
                              // Handle notifications
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              // Handle search
                            },
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(AppConstants.profileImagePath),
                            radius: width * 0.045,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Recent Section
              Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Text(
                  'Recent'.tr,
                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.3,
                child: GetBuilder<MainScreenController>(
                  builder: (controller) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      padding: EdgeInsets.only(left: width * 0.03),
                      itemBuilder: (context, index) {
                        return RecentVideoCard(index: index);
                      },
                    );
                  },
                ),
              ),
              // Menu Items
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
                child: Column(
                  children: [
                    MenuItemCard(
                      icon: Icons.history,
                      title: 'History'.tr,
                      iconSize: width * 0.07,
                      onTap: () {
  // Get.to(() => HistoryScreen());
},
                    ),
                    MenuItemCard(
                      icon: Icons.video_library,
                      title: 'Your videos'.tr,
                      iconSize: width * 0.07,
                      onTap: () {
  // Get.to(() => HistoryScreen());
},
                    ),
                    MenuItemCard(
                      icon: Icons.download_outlined,
                      title: 'Downloads'.tr,
                      subtitle: '67 videos'.tr,
                      iconSize: width * 0.07,
                      onTap: () {
  Get.to(() => DownloadHomeScreen());
},
                    ),
                    MenuItemCard(
                      icon: Icons.local_movies_outlined,
                      title: 'Your movies'.tr,
                      iconSize: width * 0.07,
                      onTap: () {
  // Get.to(() => HistoryScreen());
},
                    ),
                    MenuItemCard(
                      icon: Icons.watch_later_outlined,
                      title: 'Watch later'.tr,
                      subtitle: '4 unwatched videos'.tr,
                      iconSize: width * 0.07,
                      onTap: () {
  // Get.to(() => HistoryScreen());
},
                    ),
                  ],
                ),
              ),
              // Playlists Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Playlists'.tr,
                          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              'Recently added'.tr,
                              style: TextStyle(fontSize: width * 0.035),
                            ),
                            Icon(Icons.arrow_drop_down, size: width * 0.06),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.015),
                    // Playlist Items
                    PlaylistCard(
                      icon: Icons.add,
                      title: 'New Playlist'.tr,
                      color: Color(0xFF068BFF),
                      iconSize: width * 0.075,
                    ),
                    PlaylistCard(
                      icon: Icons.thumb_up_alt,
                      title: 'Liked Videos'.tr,
                      subtitle: '50 videos'.tr,
                      iconSize: width * 0.075,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

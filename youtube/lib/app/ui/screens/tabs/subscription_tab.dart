import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_constants.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../controllers/navigation_controller.dart';
import '../../widgets/avatar_widget.dart';
import '../../widgets/filter_chip_widget.dart';
import '../../widgets/video_card_widget.dart';

class SubscriptionTab extends StatelessWidget {
  SubscriptionTab({super.key});

  final DashboardController dashboardController =
      Get.put(DashboardController());
  final NavigationController navigationController =
      Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Obx(() {
          if (dashboardController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppConstants.logoPath,
                            height: width * 0.08,
                          ),
                          SizedBox(width: width * 0.02),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.cast),
                            iconSize: width * 0.06,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications),
                            iconSize: width * 0.06,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.search),
                            iconSize: width * 0.06,
                            onPressed: () {},
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              AppConstants.profileImage,
                            ),
                            radius: width * 0.05,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(
                  height: width * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dashboardController.profiles.length,
                    itemBuilder: (context, index) {
                      final profile = dashboardController.profiles[index];
                      return AvatarWidget(
                        image: profile.image,
                        name: profile.name,
                        width: width,
                      );
                    },
                  ),
                ),
                Divider(),
                Container(
                  height: width * 0.1,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FilterChipWidget(
                          key: UniqueKey(),
                          label: 'All',
                          isActive: true,
                          width: width),
                      FilterChipWidget(
                          key: UniqueKey(), label: 'Today', width: width),
                      FilterChipWidget(
                          key: UniqueKey(), label: 'Yesterday', width: width),
                      FilterChipWidget(
                          key: UniqueKey(), label: 'This month', width: width),
                      FilterChipWidget(
                          key: UniqueKey(), label: 'Continue', width: width),
                    ],
                  ),
                ),
                Column(
                  children: dashboardController.videos.map((video) {
                    return VideoCardWidget(
                      thumbnail: video.thumbnail,
                      avatar: video.avatar,
                      title: video.title,
                      views: video.views,
                      date: video.date,
                      width: width,
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

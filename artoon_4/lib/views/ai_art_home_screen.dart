import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import 'widgets/trending_card.dart';
import 'widgets/custom_app_bar.dart';
import '/controllers/home_controller.dart';

class AiArtHomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Adjust the length according to the number of tabs you have
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.aiArtHomeTitle),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: homeController.onPlayWinClick,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Play & Win Section
              GestureDetector(
                onTap: homeController.onPlayWinClick,
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 135,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Add tab bar here
              TabBar(
                tabs: [
                  Tab(text: 'Trending'),
                  Tab(text: 'Fashion'),
                  Tab(text: 'Anime'),
                  Tab(text: 'Digital Art'),
                ],
                labelColor: AppColors.selectedTabColor,
                unselectedLabelColor: AppColors.unselectedTabColor,
                indicatorColor: AppColors.indicatorColor,
              ),
              // Trending Avatars Section
              Container(
                height: 400, // Adjust height to fit content
                child: TabBarView(
                  children: [
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TrendingCard(
                          imageUrl: 'assets/images/autumn_3d.png',
                          title: AppStrings.autumn3d,
                          isPremium: false,
                          onTap: () {
                            homeController.onAvatarClick(AppStrings.autumn3d);
                          },
                        ),
                        TrendingCard(
                          imageUrl: 'assets/images/autumn_3d.png',
                          title: AppStrings.autumn3d,
                          isPremium: true,
                          onTap: () {
                            homeController.onAvatarClick(AppStrings.autumn3d);
                          },
                        ),
                        TrendingCard(
                          imageUrl: 'assets/images/autumn_3d.png',
                          title: AppStrings.autumn3d,
                          isPremium: false,
                          onTap: () {
                            homeController.onAvatarClick(AppStrings.autumn3d);
                          },
                        ),
                        TrendingCard(
                          imageUrl: 'assets/images/autumn_3d.png',
                          title: AppStrings.autumn3d,
                          isPremium: true,
                          onTap: () {
                            homeController.onAvatarClick(AppStrings.autumn3d);
                          },
                        ),
                      ],
                    ),
                    // Add content for other tabs here
                    Center(child: Text('Tab 2 Content')),
                    Center(child: Text('Tab 3 Content')),
                    Center(child: Text('Tab 4 Content')),
                  ],
                ),
              ),
              // Other Sections here...
            ],
          ),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: homeController.selectedTabIndex.value,
              onTap: homeController.changeTabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.art_track),
                  label: AppStrings.aiArtNav,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.enhance_photo_translate),
                  label: AppStrings.aiEnhanceNav,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_a_photo),
                  label: AppStrings.artoonAiNav,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.image),
                  label: AppStrings.aiImageNav,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: AppStrings.profileNav,
                ),
              ],
              backgroundColor: AppColors.primaryColor, // Add this line
              selectedItemColor: AppColors.selectedIconColor, // Add this line
              unselectedItemColor:
                  AppColors.unselectedIconColor, // Add this line
            )),
      ),
    );
  }
}

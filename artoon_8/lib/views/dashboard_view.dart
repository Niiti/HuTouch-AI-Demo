import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'banner_widget.dart';
import 'bottom_avatar_widget.dart';
import 'category_tabs_widget.dart';
import 'custom_navigation_bar.dart';
import 'top_avatar_widget.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientcolor.withOpacity(0.1),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ),
          // Main Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 34.0),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Trending Avatars',
                    style: AppStyles.headerStyle,
                  ),
                ),
                SizedBox(height: 16.0),
                TopAvatarWidget(),
                SizedBox(height: 16.0),
                BannerWidget(),
                SizedBox(height: 16.0),
                CategoryTabsWidget(),
                SizedBox(height: 16.0),
                BottomAvatarWidget(),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
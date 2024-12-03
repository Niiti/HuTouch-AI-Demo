import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipely/home_screen/core/constants/config.dart';
import 'package:recipely/home_screen/core/utils/responsive.dart';
import 'package:recipely/home_screen/presentation/widgets/bottom_nav_bar.dart';
import 'package:recipely/user_screen/app/ui/widgets/dashboard_header_widget.dart';
import 'package:recipely/user_screen/app/ui/widgets/favorites_section_widget.dart';
import 'package:recipely/user_screen/app/ui/widgets/user_profile_widget.dart';

import '../../../controllers/dashboard_controller.dart';
import '../../../core/utils/responsive_helper.dart';

class DashboardMain extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    Size size = ResponsiveHelper.getSize(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DashboardHeaderWidget(size: size),
              UserProfileWidget(size: size),
              FavoritesSectionWidget(size: size),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(3, 38, 40, 1),
        onPressed: () {},
        child: Image.asset(Assets.chefIcon,
            width: responsiveWidth(context, 0.075)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,    );
  }
}

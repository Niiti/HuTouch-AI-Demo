import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../constants/app_values.dart';
import '../controllers/notif_controller.dart';
import '../widgets/main_bottom_navbar.dart'; // Import the MainBottomNavBar widget

class NotificationsView extends StatelessWidget {
  final NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    final double padding = MediaQuery.of(context).size.width * 0.04;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.notification,
                      style: TextStyle(
                        fontSize: AppValues.fontSizeLarge,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas Neue',
                        color: AppColors.black,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_4_bar, size: 24),
                        SizedBox(width: 8),
                        Icon(Icons.wifi, size: 24),
                        SizedBox(width: 8),
                        Icon(Icons.battery_full, size: 24),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),

              // Global Allow Notifications Toggle
              Obx(() => Container(
                    color: AppColors.white,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: padding),
                      title: Text(
                        AppString.allowNotifications,
                        style: TextStyle(
                          fontSize: AppValues.fontSizeSmall,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                          color: AppColors.black,
                        ),
                      ),
                      trailing: Switch(
                        value: controller.allowNotifications.value,
                        activeColor: AppColors.switchActive,
                        onChanged: (value) {
                          controller.toggleAllowNotifications(value);
                        },
                      ),
                    ),
                  )),
              Divider(),

              // League Alerts Section
              Padding(
                padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.leagueAlerts,
                      style: TextStyle(
                        fontSize: AppValues.fontSizeMedium,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas Neue',
                        color: AppColors.black,
                      ),
                    ),
                    Obx(() => Column(
                          children: List.generate(
                            controller.leagueAlerts.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              padding: EdgeInsets.all(padding * 0.5),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        controller.leagueAlerts[index]['icon'],
                                        height: 32,
                                        width: 32,
                                      ),
                                      SizedBox(width: padding),
                                      Text(
                                        controller.leagueAlerts[index]['title'],
                                        style: TextStyle(
                                          fontSize: AppValues.fontSizeSmall,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller.leagueAlerts[index]['status']
                                            .value
                                        ? 'On'
                                        : 'Off',
                                    style: TextStyle(
                                      fontSize: AppValues.fontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: controller.leagueAlerts[index]
                                              ['status']
                                          .value
                                          ? AppColors.black
                                          : AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),

                    SizedBox(height: padding),

                    // Team Alerts Section
                    Text(
                      AppString.teamAlerts,
                      style: TextStyle(
                        fontSize: AppValues.fontSizeMedium,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas Neue',
                        color: AppColors.black,
                      ),
                    ),
                    Obx(() => Column(
                          children: List.generate(
                            controller.teamAlerts.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              padding: EdgeInsets.all(padding * 0.5),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        controller.teamAlerts[index]['icon'],
                                        height: 32,
                                        width: 32,
                                      ),
                                      SizedBox(width: padding),
                                      Text(
                                        controller.teamAlerts[index]['title'],
                                        style: TextStyle(
                                          fontSize: AppValues.fontSizeSmall,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller.teamAlerts[index]['status']
                                            .value
                                        ? 'On'
                                        : 'Off',
                                    style: TextStyle(
                                      fontSize: AppValues.fontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: controller.teamAlerts[index]
                                              ['status']
                                          .value
                                          ? AppColors.black
                                          : AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavBar(), // Add the MainBottomNavBar here
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/app_constants.dart';
import 'modules/onboarding/presentations/onboarding_page.dart';
import 'modules/onboarding/controllers/onboarding_controller.dart';
import './modules/registration/controllers/registration_controller.dart';
import './modules/registration/presentations/registration_page.dart';
import './modules/login/controllers/login_controller.dart';
import './modules/login/presentations/login_page.dart';
import 'themes/app_theme.dart';
import './modules/dashboard/controllers/dashboard_controller.dart';
import './modules/dashboard/presentations/dashboard_page.dart';
import './modules/sport_screen/controllers/sport_controller.dart';
import './modules/sport_screen/presentations/sport_page.dart';
import './modules/players/controllers/players_controller.dart';
import './modules/players/presentations/players_page.dart';
import './modules/notifications/controllers/notif_controller.dart';
import './modules/notifications/presentations/notif_view.dart';
import './modules/matches_feature/controllers/match_controller.dart';
import './modules/matches_feature/presentations/match_page.dart';
import './modules/stats_screen/controllers/stats_controller.dart';
import './modules/stats_screen/presentations/stats_page.dart';

void main() {
  runApp(SportifyApp());
}

class SportifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appTitle,
      theme: AppTheme.lightTheme,
      initialRoute: AppConstants.onboardingRoute,
      getPages: [
        GetPage(
          name: AppConstants.onboardingRoute,
          page: () => OnboardingPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<OnboardingController>(() => OnboardingController());
          }),
        ),
        GetPage(
          name: AppConstants.createAccountRoute,
          page: () => RegistrationPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<RegistrationController>(() => RegistrationController());
          }),
        ),
        GetPage(
          name: AppConstants.loginRoute,
          page: () => LoginPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<LoginController>(() => LoginController());
          }),
        ),
        GetPage(
          name: AppConstants.profileRoute,
          page: () => SportPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SportController>(() => SportController());
          }),
        ),
        GetPage(
          name: AppConstants.playersRoute,
          page: () => PlayersPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<PlayersController>(() => PlayersController());
          }),
        ),
        GetPage(
          name: AppConstants.dashBoardRoute,
          page: () => DashboardPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<DashboardController>(() => DashboardController());
          }),
        ),
        GetPage(
          name: AppConstants.notificationRoute,
          page: () => NotificationsView(),
          binding: BindingsBuilder(() {
            Get.lazyPut<NotificationsController>(
                () => NotificationsController());
          }),
        ),
        GetPage(
          name: AppConstants.matchFeatures,
          page: () => MatchPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<MatchController>(() => MatchController());
          }),
        ),
        GetPage(
          name: AppConstants.statsScreenRoute,
          page: () => StatsPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<StatsController>(() => StatsController());
          }),
        ),
      ],
    );
  }
}

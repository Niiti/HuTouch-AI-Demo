import 'package:get/get.dart';
import '../views/dashboard_view.dart';
import '../views/home_page.dart';
import '../views/ai_functionality_page.dart';
import '../views/next_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.AI_FUNCTIONALITY,
      page: () => AIFunctionalityPage(),
    ),
    GetPage(
      name: AppRoutes.NEXT_PAGE,
      page: () => NextPage(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardView(),
    ),
  ];
}
import 'package:get/get.dart';
import '../views/go_premium_screen.dart';
import '../views/give_access_view.dart';

class AppRoutes {
  static const giveAccess = '/give-access';
  static const goPremium = '/go-premium';

  static final routes = [
    GetPage(name: giveAccess, page: () => GiveAccessView()),
    GetPage(name: goPremium, page: () => GoPremiumScreen()),
  ];
}

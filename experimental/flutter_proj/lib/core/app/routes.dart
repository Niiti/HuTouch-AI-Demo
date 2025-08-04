import 'package:get/get.dart';
import 'package:my_project/modules/societies/controllers/societies_controller.dart';
import 'package:my_project/modules/societies/data/repositories/societies_repository.dart';
import 'package:my_project/modules/societies/presentation/screens/societies_screen.dart';

class AppRoutes {
  static const societies = '/societies';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.societies,
      page: () => const SocietiesScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ISocietiesRepository>(() => SocietiesRepository());
        Get.lazyPut<SocietiesController>(
          () => SocietiesController(Get.find<ISocietiesRepository>()),
        );
      }),
    ),
  ];
}

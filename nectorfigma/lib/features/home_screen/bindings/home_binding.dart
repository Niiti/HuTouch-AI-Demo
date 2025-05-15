import 'package:get/get.dart';
import 'package:nectorfigma/features/home_screen/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

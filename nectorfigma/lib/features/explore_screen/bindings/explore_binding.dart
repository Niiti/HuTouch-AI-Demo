import 'package:get/get.dart';
import 'package:nectorfigma/features/explore_screen/controllers/explore_controller.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(() => ExploreController());
  }
}

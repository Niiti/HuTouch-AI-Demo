import 'package:get/get.dart';
import 'package:nectorfigma/features/filters_screen/controllers/filters_controller.dart';

class FiltersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FiltersController>(() => FiltersController());
  }
}

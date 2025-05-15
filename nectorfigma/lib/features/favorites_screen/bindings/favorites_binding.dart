import 'package:get/get.dart';
import 'package:nectorfigma/features/favorites_screen/controllers/favorites_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
  }
}

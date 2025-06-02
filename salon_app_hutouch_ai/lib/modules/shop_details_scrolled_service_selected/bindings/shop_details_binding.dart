import 'package:get/get.dart';
import 'package:salon_app_hutouch_ai/modules/shop_details_scrolled_service_selected/controllers/shop_details_controller.dart';

class ShopDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopDetailsController>(() => ShopDetailsController());
  }
}

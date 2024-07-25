import 'package:get/get.dart';

class PremiumController extends GetxController {
  void upgradeNow() {
    // Implement your upgrade logic here
    Get.snackbar('Upgrade', 'User chooses to upgrade to premium.');
  }

  void skip() {
    // Implement your skip logic here
    Get.back();
  }
}

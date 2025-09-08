import 'package:get/get.dart';

class CelebrationSuccessController extends GetxController {
  final RxBool dismissed = false.obs;

  void close([bool viaDone = false]) {
    dismissed.value = true;
    if (Get.isOverlaysClosed) {
      return;
    }
    if (viaDone) {
      Get.back<bool>(result: true);
    } else {
      Get.back<void>();
    }
  }
}
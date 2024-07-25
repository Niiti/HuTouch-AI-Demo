import 'package:get/get.dart';

class GiveAccessController extends GetxController {
  void notNow() {
    Get.back();
  }

  void letsDoIt() {
    // Call to the method that requests photo permissions or opens file picker.
    requestPhotoPermissions();
  }

  Future<void> requestPhotoPermissions() async {
    // Logic to request photo permissions from the device
    // Use appropriate packages and methods to request permissions
    // Refer to GetX documentation or Flutter documentation for detailed implementation
  }
}

import 'package:get/get.dart';
import 'package:build_me_up/core/routes/app_routes.dart';

class OneController extends GetxController {
  void onTapSignIn() {
    Get.toNamed(AppRoutes.signIn);
  }

  void onTapSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }
}

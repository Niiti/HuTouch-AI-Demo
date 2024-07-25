import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedTabIndex = 0.obs;
  var avatarClicked = ''.obs;

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  void onAvatarClick(String avatarName) {
    Get.snackbar('Avatar Clicked', 'You clicked on $avatarName.');
    avatarClicked.value = avatarName;
  }

  void onPlayWinClick() {
    Get.snackbar('Play & Win', 'This will take you to the Play & Win Page.');
  }
}

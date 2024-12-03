import 'package:get/get.dart';

class DownloadScreenController extends GetxController {
  // Define your reactive variables here
  var videoList = List<int>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideos();
  }

  void fetchVideos() {
    try {
      // Simulate fetching videos
      videoList.value = List.generate(8, (index) => index);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load videos');
    }
  }
}

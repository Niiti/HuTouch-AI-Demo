import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  RxInt currentVideoIndex = 0.obs; // Observable for the current video index
  final List<String> videoUrls = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
  ];

  @override
  void onInit() {
    super.onInit();
    initializeVideoPlayer(currentVideoIndex.value);
  }

Future<void> initializeVideoPlayer(int index) async {
  if (index < videoUrls.length) {
    // Dispose of the previous controller if it exists
    videoPlayerController?.dispose();

    // Initialize a new controller for the current video
    videoPlayerController = VideoPlayerController.asset(videoUrls[index]);
    await videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    update(); // Notify the UI of updates
  }
}

  void changeVideo(int direction) {
    if (direction > 0) {
      // Scroll down
      currentVideoIndex.value = (currentVideoIndex.value + 1) % videoUrls.length;
    } else {
      // Scroll up
      currentVideoIndex.value =
          (currentVideoIndex.value - 1 + videoUrls.length) % videoUrls.length;
    }

    initializeVideoPlayer(currentVideoIndex.value);
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
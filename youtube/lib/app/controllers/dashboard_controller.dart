import 'package:get/get.dart';
import '../services/network_service.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;
  var profiles = <Profile>[].obs;
  var videos = <Video>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfiles();
    fetchVideos();
  }

  Future<void> fetchProfiles() async {
    try {
      isLoading(true);
      var fetchedProfiles = await NetworkService.getProfiles();
      profiles.assignAll(fetchedProfiles);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profiles');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchVideos() async {
    try {
      isLoading(true);
      var fetchedVideos = await NetworkService.getVideos();
      videos.assignAll(fetchedVideos);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load videos');
    } finally {
      isLoading(false);
    }
  }
}

class Profile {
  final String image;
  final String name;

  Profile({required this.image, required this.name});
}

class Video {
  final String thumbnail;
  final String avatar;
  final String title;
  final String views;
  final String date;

  Video({
    required this.thumbnail,
    required this.avatar,
    required this.title,
    required this.views,
    required this.date,
  });
}

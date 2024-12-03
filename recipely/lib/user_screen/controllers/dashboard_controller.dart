import 'package:get/get.dart';
import '../data/app_config.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  var favorites = <FavoriteItem>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavorites();
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void fetchFavorites() async {
    try {
      isLoading.value = true;
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));
      favorites.value = AppConfig.sampleFavorites;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load favorites');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(String title) {
    var existing = favorites.firstWhereOrNull((fav) => fav.title == title);
    if (existing != null) {
      favorites.remove(existing);
    } else {
      // Add logic to add favorite
    }
  }
}

class FavoriteItem {
  final String imageUrl;
  final String title;
  final String author;

  FavoriteItem({required this.imageUrl, required this.title, required this.author});
}

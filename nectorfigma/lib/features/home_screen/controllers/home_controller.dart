import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';
import 'package:nectorfigma/core/utils/utils.dart';

class HomeController extends GetxController {
  final banners =
      <String>[ImagesAsset.banner, ImagesAsset.banner, ImagesAsset.banner].obs;

  final currentBannerIndex = 0.obs;
  final cartItems = <String>[].obs;
  final selectedTabIndex = 0.obs;

  void addToCart(String item) {
    cartItems.add(item);
  }

  void showLocationDialog() {
    Get.defaultDialog(
      title: AppStrings.selectLocation,
      middleText: AppStrings.locationContent,
      textConfirm: AppStrings.close,
      onConfirm: () => Get.back(),
    );
  }

  void searchItems(String query) {
    try {
      // TODO: implement search logic
    } catch (e) {
      Utils.showErrorSnackBar(e.toString());
    }
  }

  void seeAllExclusiveOffers() {
    // TODO: navigate to exclusive offers
  }

  void seeAllBestSelling() {
    // TODO: navigate to best selling
  }

  void updateBannerIndex(int index) {
    currentBannerIndex.value = index;
  }

  void onTabChanged(int index) {
    selectedTabIndex.value = index;
  }
}

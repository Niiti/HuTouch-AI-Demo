import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/images_asset.dart';
import 'package:nectorfigma/core/utils/utils.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/features/favorites_screen/models/product_model.dart';

class FavoritesController extends GetxController {
  final favorites = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    favorites.assignAll([
      ProductModel(
        imageAsset: ImagesAsset.sprite,
        name: 'Sprite Can',
        subText: '325ml, Price',
        price: 1.50,
      ),
      ProductModel(
        imageAsset: ImagesAsset.coke,
        name: 'Diet Coke',
        subText: '355ml, Price',
        price: 1.99,
      ),
      ProductModel(
        imageAsset: ImagesAsset.appleJuice,
        name: 'Apple & Grape Juice',
        subText: '2L, Price',
        price: 15.50,
      ),
      ProductModel(
        imageAsset: ImagesAsset.cocaCola,
        name: 'Coca Cola Can',
        subText: '325ml, Price',
        price: 4.99,
      ),
      ProductModel(
        imageAsset: ImagesAsset.pepsi,
        name: 'Pepsi Can',
        subText: '330ml, Price',
        price: 4.99,
      ),
    ]);
  }

  void addAllToCart() {
    Utils.showSuccessSnackBar(AppStrings.allAddedMessage);
  }
}

import '../controllers/dashboard_controller.dart';

class AppConfig {
  static const String appTitle = 'Recipe App';
  static final List<FavoriteItem> sampleFavorites = [
    FavoriteItem(imageUrl: 'assets/food_element1.png', title: 'Recipe Title 1', author: 'Author One'),
    FavoriteItem(imageUrl: 'assets/food_element2.png', title: 'Recipe Title 2', author: 'Author Two'),
    FavoriteItem(imageUrl: 'assets/food_element3.png', title: 'Recipe Title 3', author: 'Author Three'),
    FavoriteItem(imageUrl: 'assets/food_element4.png', title: 'Recipe Title 4', author: 'Author Four'),
  ];
}

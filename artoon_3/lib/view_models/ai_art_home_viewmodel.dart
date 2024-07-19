import 'package:flutter/material.dart';
import '../models/art_model.dart';
import '../resources/strings.dart';

class AiArtHomeViewModel extends ChangeNotifier {
  List<ArtModel> _trendingAvatars = [
    ArtModel(
        name: "Autumn 3D",
        imageUrl: "assets/images/image.png",
        isSelected: false),
    // Add more avatars here
  ];

  List<ArtModel> _artItems = [
    ArtModel(
        name: "Autumn 3D",
        imageUrl: "assets/images/autumn_3d.png",
        isSelected: false),
    ArtModel(
        name: "Autumn 3D",
        imageUrl: "assets/images/autumn_3d.png",
        isSelected: false),
    // Add more art items here
  ];

  String _selectedCategory = Strings.categories[0];
  int _currentIndex = 0;

  List<ArtModel> get trendingAvatars => _trendingAvatars;
  List<ArtModel> get artItems => _artItems;
  String get selectedCategory => _selectedCategory;
  int get currentIndex => _currentIndex;

  void onCategorySelected(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void onArtItemSelected(ArtModel artItem) {
    // Logic for selecting art item
    artItem.isSelected = !artItem.isSelected;
    notifyListeners();
  }

  void onBottomNavItemSelected(int index) {
    _currentIndex = index;
    // Logic for navigation should be here
    notifyListeners();
  }

  void onTryNow() {
    // Logic for Play & Win button
    print('Try Now tapped!');
  }
}

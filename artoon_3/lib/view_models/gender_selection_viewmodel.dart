import 'package:flutter/material.dart';
import '../views/ai_art_home_screen.dart';
enum Gender { Woman, Man }

class GenderSelectionViewModel with ChangeNotifier {
  Gender? _selectedGender;

  Gender? get selectedGender => _selectedGender;

  void selectGender(Gender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void proceedToNext(BuildContext context) {
    // Handle navigation or any other business logic to either the next screen or process
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AiArtHomeScreen()),
    );

  }
}

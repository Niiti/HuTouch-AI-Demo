import 'package:flutter/material.dart';
import '../models/language.dart';
import '../views/feature_screen.dart';

class LanguageSelectionViewModel with ChangeNotifier {
  Language? _selectedLanguage;
  List<Language> _languages = [
    Language('English', 'assets/flags/english.png'),
    Language('Arabic', 'assets/flags/arabic.png'),
    Language('Spanish', 'assets/flags/spanish.png'),
    Language('French', 'assets/flags/french.png'),
    Language('German', 'assets/flags/german.png'),
    Language('Portuguese', 'assets/flags/portugal.png'),
    Language('Korean', 'assets/flags/korean.png'),
  ];

  Language? get selectedLanguage => _selectedLanguage;
  List<Language> get languages => _languages;

  void selectLanguage(Language language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void proceedToNext(BuildContext context) {
    if (_selectedLanguage != null) {
      // Navigate to the next screen, handle navigation logic
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FeatureScreen()),
      );
    } else {
      // Show error if no language is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a language.')),
      );
    }
  }
}

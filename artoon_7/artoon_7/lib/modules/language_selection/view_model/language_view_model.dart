import 'package:get/get.dart';
import '../../feature_selection/view/feature_selection_screen.dart';
import '../model/language_model.dart';

class LanguageViewModel extends GetxController {
  var selectedLanguage = 'English'.obs;

  // Make languages reactive
  var languages = <Language>[
    Language(name: 'English', flag: 'assets/flags/hindi.png'),
    Language(name: 'Arabic', flag: 'assets/flags/hindi.png'),
    Language(name: 'Spanish', flag: 'assets/flags/hindi.png'),
    Language(name: 'French', flag: 'assets/flags/hindi.png'),
    Language(name: 'German', flag: 'assets/flags/hindi.png'),
    Language(name: 'Hindi', flag: 'assets/flags/hindi.png'),
    Language(name: 'Portuguese', flag: 'assets/flags/hindi.png'),
    Language(name: 'Korean', flag: 'assets/flags/hindi.png'),
  ].obs;

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }

  void next() {
    try {
      Get.to(FeatureSelectionScreen());
    } catch (e) {
      print("Navigation error: $e");
    }
  }
  
  nextScreen() {}
}
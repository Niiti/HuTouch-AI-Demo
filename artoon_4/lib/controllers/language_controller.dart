import 'package:get/get.dart';
import '../models/language_model.dart';

class LanguageController extends GetxController {
  var languages = <Language>[].obs;
  var selectedLanguage = Rx<Language?>(null);

  @override
  void onInit() {
    // Initialize languages list from data
    languages.addAll([
      Language('English', 'assets/flags/english.png'),
      Language('Arabic', 'assets/flags/arabic.png'),
      Language('Spanish', 'assets/flags/french.png'),
      Language('French', 'assets/flags/german.png'),
      Language('German', 'assets/flags/hindi.png'),
      Language('Hindi', 'assets/flags/korean.png'),
      Language('Portuguese', 'assets/flags/portugal.png'),
      Language('Korean', 'assets/flags/spanish.png'),
    ]);
    super.onInit();
  }

  void selectLanguage(Language language) {
    selectedLanguage.value = language;
    update();
  }

  bool isSelected(Language language) {
    return selectedLanguage.value == language;
  }
}

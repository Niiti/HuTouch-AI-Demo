import 'package:get/get.dart';
import 'package:meditate/core/constants/app_strings.dart';

class MusicController extends GetxController {
  final isFavorited = false.obs;
  final selectedNarrator = AppStrings.maleVoice.obs;

  void toggleFavorite() {
    isFavorited.value = !isFavorited.value;
  }

  void shareCourse() {
    // Share functionality intentionally removed; no-op to preserve UI references.
  }

  void selectNarrator(String narrator) {
    selectedNarrator.value = narrator;
  }
}

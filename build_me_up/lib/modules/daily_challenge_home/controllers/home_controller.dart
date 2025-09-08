// file: lib/modules/daily_challenge_home/controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_images.dart';
import 'package:build_me_up/modules/daily_challenge_home/models/day_status.dart';
import 'package:build_me_up/modules/daily_challenge_home/models/recipe_model.dart';

class DailyChallengeHomeController extends GetxController {
  final RxString userName = 'Sophia'.obs;
  final RxInt currentDay = 7.obs;
  final RxDouble targetKcal = 1700.0.obs;
  final RxDouble consumedKcal = 0.0.obs;
  final RxDouble fatTarget = 35.0.obs;
  final RxDouble fatConsumed = 0.0.obs;
  final RxDouble proteinTarget = 114.0.obs;
  final RxDouble proteinConsumed = 0.0.obs;
  final RxBool challengeStarted = false.obs;

  final RxList<DayStatus> lastSixDays = RxList<DayStatus>([
    DayStatus(dayNumber: 1, completed: true),
    DayStatus(dayNumber: 2, completed: true),
    DayStatus(dayNumber: 3, completed: true),
    DayStatus(dayNumber: 4, completed: true),
    DayStatus(dayNumber: 5, completed: true),
    DayStatus(dayNumber: 6, completed: true),
  ]);

  // ✅ Use calories & image (not kcal/assetPath)
  final RxList<RecipeModel> recipes = RxList<RecipeModel>([
    RecipeModel(
      title: 'Chia Pudding',
      calories: 257,
      image: AppImages.chiaPuddingA,
    ),
    RecipeModel(
      title: 'Veggie Quesadilla',
      calories: 550,
      image: AppImages.quesadilla,
    ),
    RecipeModel(
      title: 'Chia Pudding',
      calories: 257,
      image: AppImages.chiaPuddingB,
    ),
    RecipeModel(
      title: 'Chia Pudding',
      calories: 257,
      image: AppImages.chiaPuddingAlt,
    ),
  ]);

  void startChallenge() {
    challengeStarted.value = true;
  }

  void updateKcal(double consumed) {
    consumedKcal.value = consumed.clamp(0, targetKcal.value);
  }

  void updateNutrient({double? fat, double? protein}) {
    if (fat != null) {
      fatConsumed.value = fat.clamp(0, fatTarget.value);
    }
    if (protein != null) {
      proteinConsumed.value = protein.clamp(0, proteinTarget.value);
    }
  }

  @override
  void onClose() {
    recipes.clear();
    lastSixDays.clear();
    super.onClose();
  }
}

class HomeController extends GetxController {
  final RxInt targetKcal = 1700.obs;
  final RxInt consumedKcal = 1200.obs;

  final RxInt fatCurrent = 10.obs;
  final RxInt fatTarget = 35.obs;

  final RxInt proteinCurrent = 30.obs;
  final RxInt proteinTarget = 115.obs;

  final RxMap<String, int> mealCurrent =
      <String, int>{'breakfast': 500, 'lunch': 0, 'snack': 0, 'dinner': 0}.obs;

  final RxMap<String, int> mealTarget =
      <String, int>{
        'breakfast': 500,
        'lunch': 500,
        'snack': 200,
        'dinner': 500,
      }.obs;

  // ❌ Avoid `const` before `.obs`
  final RxList<RecipeModel> recipes =
      <RecipeModel>[
        RecipeModel(
          title: 'Falafel Sandwich',
          calories: 500,
          image: AppImages.quesadilla,
        ),
        RecipeModel(
          title: 'Veggie Omelets',
          calories: 300,
          image: AppImages.scrambledEggsOnToast,
        ),
      ].obs;

  void addToMeal(String key, int calories) {
    final current = mealCurrent[key] ?? 0;
    mealCurrent[key] = current + calories;
    consumedKcal.value = consumedKcal.value + calories;
  }

  double get mainProgress {
    final t = targetKcal.value.toDouble();
    if (t == 0) return 0;
    return (consumedKcal.value / t).clamp(0, 1);
  }

  double subProgress(int current, int target) {
    if (target == 0) return 0;
    return (current / target).clamp(0, 1);
  }
}

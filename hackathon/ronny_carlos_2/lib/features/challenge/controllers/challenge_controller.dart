import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hackaton_end/core/constants/app_assets.dart';
import 'package:hackaton_end/core/network/dio_client.dart';
import 'package:hackaton_end/features/challenge/models/meal.dart';
import 'package:hackaton_end/features/challenge/models/nutrition_summary.dart';
import 'package:hackaton_end/features/challenge/models/recipe.dart';

class ChallengeController extends ChangeNotifier {
  NutritionSummary _summary = const NutritionSummary(
    targetCalories: 1700,
    consumedCalories: 500,
    targetFat: 35,
    consumedFat: 10,
    targetProtein: 115,
    consumedProtein: 30,
  );

  final List<MealLog> _logs = [];
  final Map<MealType, MealStat> _mealStats = {
    MealType.breakfast: MealStat(
      title: 'Breakfast',
      goalCalories: 500,
      consumedCalories: 500,
    ),
    MealType.lunch: MealStat(title: 'Lunch', goalCalories: 500, consumedCalories: 0),
    MealType.snack: MealStat(title: 'Snack', goalCalories: 200, consumedCalories: 0),
    MealType.dinner: MealStat(title: 'Dinner', goalCalories: 500, consumedCalories: 0),
  };

  NutritionSummary get summary => _summary;

  Map<MealType, MealStat> get mealStats => _mealStats;

  List<Recipe> recipes = [];

  void addMeal(MealLog log) {
    _logs.add(log);
    final prev = _mealStats[log.type]!;
    _mealStats[log.type] = prev.copyWith(
      consumedCalories: prev.consumedCalories + log.calories,
    );
    _summary = _summary.copyWith(
      consumedCalories: _summary.consumedCalories + log.calories,
      consumedFat: _summary.consumedFat + log.fat,
      consumedProtein: _summary.consumedProtein + log.protein,
    );
    notifyListeners();
  }

  Future<void> getFood() async {
    final supaBaseUrl = dotenv.env['SUPABASE_URL']!;
    final supaBaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;

    final url = "$supaBaseUrl/rest/v1/food";

    final headers = {
      'Content-Type': 'application/json',
      'apikey': supaBaseAnonKey,
      'Authorization': 'Bearer $supaBaseAnonKey',
    };

    try {
      final resp = await DioClient().getDio(url: url, header: headers);

      print("✅ Respuesta Supabase: ${resp.data}");

      final List<dynamic> data = resp.data;

      recipes.clear(); // limpiamos recetas anteriores
      recipes.addAll(data.map((e) => Recipe.fromJson(e)).toList());
      notifyListeners();
    } catch (e) {
      print("❌ Error: $e");
    }
  }
}

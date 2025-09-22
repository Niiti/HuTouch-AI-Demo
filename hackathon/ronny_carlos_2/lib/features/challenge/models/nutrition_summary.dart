class NutritionSummary {
  final int targetCalories;
  final int consumedCalories;
  final int targetFat;
  final int consumedFat;
  final int targetProtein;
  final int consumedProtein;
  const NutritionSummary({
    required this.targetCalories,
    required this.consumedCalories,
    required this.targetFat,
    required this.consumedFat,
    required this.targetProtein,
    required this.consumedProtein,
  });

  double get caloriesProgress => targetCalories == 0 ? 0 : consumedCalories / targetCalories;
  double get fatProgress => targetFat == 0 ? 0 : consumedFat / targetFat;
  double get proteinProgress => targetProtein == 0 ? 0 : consumedProtein / targetProtein;

  NutritionSummary copyWith({
    int? targetCalories,
    int? consumedCalories,
    int? targetFat,
    int? consumedFat,
    int? targetProtein,
    int? consumedProtein,
  }) {
    return NutritionSummary(
      targetCalories: targetCalories ?? this.targetCalories,
      consumedCalories: consumedCalories ?? this.consumedCalories,
      targetFat: targetFat ?? this.targetFat,
      consumedFat: consumedFat ?? this.consumedFat,
      targetProtein: targetProtein ?? this.targetProtein,
      consumedProtein: consumedProtein ?? this.consumedProtein,
    );
  }
}

enum MealType { breakfast, lunch, snack, dinner }

class MealLog {
  final MealType type;
  final int calories;
  final int fat;
  final int protein;
  MealLog({
    required this.type,
    required this.calories,
    required this.fat,
    required this.protein,
  });
}

class MealStat {
  final String title;
  final int goalCalories;
  final int consumedCalories;
  MealStat({
    required this.title,
    required this.goalCalories,
    required this.consumedCalories,
  });

  MealStat copyWith({int? consumedCalories}) =>
      MealStat(title: title, goalCalories: goalCalories, consumedCalories: consumedCalories ?? this.consumedCalories);
}

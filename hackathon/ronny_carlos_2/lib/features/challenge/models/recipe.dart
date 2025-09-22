class Recipe {
  final String id;
  final String title;
  final String calories;
  final String imagePath;

  Recipe({
    required this.id,
    required this.title,
    required this.calories,
    required this.imagePath,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      calories: json['calories'] ?? '',
      imagePath: json['imagePath'] ?? 'falafel_wraps.png', // columna en tu tabla food
    );
  }
}

class Car {
  final String name;
  final String imagePath;
  final String details;
  final String distance;
  final double rating;
  final int reviews;

  Car({
    required this.name,
    required this.imagePath,
    this.details = '',
    this.distance = '',
    this.rating = 0.0,
    this.reviews = 0,
  });
}

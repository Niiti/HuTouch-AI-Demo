class Location {
  final int id;
  final String title;
  final String address;
  final String? distance;
  final String iconPath;
  final int? colorCode;

  Location({
    required this.id,
    required this.title,
    required this.address,
    this.distance,
    required this.iconPath,
     this.colorCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      title: json['title'],
      address: json['address'],
      distance: json['distance'],
      iconPath: json['iconPath'],
      colorCode: json['colorCode'] ?? 0,
    );
  }
}
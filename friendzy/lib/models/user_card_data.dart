// lib/models/user_card_data.dart

class UserCardData {
  final String image;
  final String name;
  final int age;
  final String location;
  final String distance;
  final List<String> interests;

  UserCardData({
    required this.image,
    required this.name,
    required this.age,
    required this.location,
    required this.distance,
    required this.interests,
  });
}

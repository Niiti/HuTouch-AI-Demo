import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/user_data.dart';
import '../domain/user.dart';

// Define a provider to fetch user profile data
final userProfileProvider = Provider<User>((ref) {
  return User(
    name: userData['name']!,
    email: userData['email']!,
    phone: userData['phone']!,
    songs: int.parse(userData['songs']!),
    playlists: int.parse(userData['playlists']!),
    artists: int.parse(userData['artists']!),
  );
});
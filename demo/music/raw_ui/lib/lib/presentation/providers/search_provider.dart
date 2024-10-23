import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/artists_data.dart';
import '../data/categories_data.dart';
import '../domain/artist.dart';
import '../domain/category.dart';

final searchTextProvider = StateProvider<String>((ref) => '');

final filteredArtistsProvider = Provider.family<List<Artist>, String>((ref, searchText) {
  final artists = ref.read(artistsDataProvider);
  if (searchText.isEmpty) return artists;
  return artists.where((artist) => artist.name.toLowerCase().contains(searchText.toLowerCase())).toList();
});

final filteredCategoriesProvider = Provider.family<List<Category>, String>((ref, searchText) {
  final categories = ref.read(categoriesDataProvider);
  if (searchText.isEmpty) return categories;
  return categories.where((category) => category.title.toLowerCase().contains(searchText.toLowerCase())).toList();
});
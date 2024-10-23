import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/category.dart';

final categoriesDataProvider = Provider<List<Category>>((ref) => [
  Category(imageUrl: 'https://picsum.photos/200', title: 'TAMIL'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'INTERNATIONAL'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'POP'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'HIP-HOP'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'DANCE'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'COUNTRY'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'INDIE'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'JAZZ'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'PUNK'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'R&B'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'DISCO'),
  Category(imageUrl: 'https://picsum.photos/200', title: 'ROCK'),
]);
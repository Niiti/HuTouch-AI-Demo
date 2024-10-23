import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/artist.dart';

final artistsDataProvider = Provider<List<Artist>>((ref) => [
  Artist(imageUrl: 'https://picsum.photos/200', name: 'Childish Gambino'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'Marvin Gaye'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'Kanye West'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'Justin Bieber'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'Charlie Puth'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'Imagine Dragons'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'Kygo'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'Taylor Swift'),
  Artist(imageUrl: 'https://picsum.photos/seed/picsum/200/300', name: 'The Chainsmokers'),
]);

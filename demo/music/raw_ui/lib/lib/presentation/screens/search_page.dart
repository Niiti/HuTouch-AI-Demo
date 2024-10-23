import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/search_provider.dart';
import '../widgets/artist_circle.dart';
import '../widgets/category_card.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(searchTextProvider);
    final filteredArtists = ref.watch(filteredArtistsProvider(searchText));
    final filteredCategories = ref.watch(filteredCategoriesProvider(searchText));

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.75),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          ref.read(searchTextProvider.notifier).state = text;
                        },
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.75),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search songs, artist, album…',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.75),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    Icons.trending_up,
                    color: Colors.white.withOpacity(0.75),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Trending artists',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredArtists.length,
                itemBuilder: (context, index) {
                  return ArtistCircle(
                    imageUrl: filteredArtists[index].imageUrl,
                    name: filteredArtists[index].name,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Browse',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  itemCount: filteredCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 148 / 80,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      imageUrl: filteredCategories[index].imageUrl,
                      title: filteredCategories[index].title,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
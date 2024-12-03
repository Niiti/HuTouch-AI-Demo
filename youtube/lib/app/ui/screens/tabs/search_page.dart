import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:youtube/app/constants/app_constants.dart';
import 'package:youtube/app/controllers/search_controller.dart' as sc;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final sc.SearchController _searchController = Get.put(sc.SearchController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen to scroll events for pagination
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // Do NOT dispose of the controller manually
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Near the bottom
      _searchController.fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search', style: TextStyle(color: AppConstants.iconColor)),
        backgroundColor: AppConstants.appBarColor,
        iconTheme: IconThemeData(color: AppConstants.iconColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController.textController,
              onChanged: _searchController.onSearchChanged, // Bind onChanged
              decoration: InputDecoration(
                hintText: 'Search YouTube...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Obx(() {
                if (_searchController.isLoading.value &&
                    _searchController.suggestions.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                if (_searchController.suggestions.isEmpty) {
                  return Center(child: Text('No results found.'));
                }
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: _searchController.suggestions.length +
                      (_searchController.hasMore.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < _searchController.suggestions.length) {
                      final video = _searchController.suggestions[index];
                      return Card(
                        elevation: 2.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: video.thumbnailUrl,
                            width: 100,
                            height: 56,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Container(color: Colors.grey[300]),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          title: Text(
                            video.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            video.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            // Handle suggestion tap here, e.g., navigate to video details or play video
                          },
                        ),
                      );
                    } else {
                      // Display loading indicator at the bottom
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}



// youtube_video.dart
class YouTubeVideo {
  final String title;
  final String description;
  final String thumbnailUrl;

  YouTubeVideo({
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  });

  factory YouTubeVideo.fromJson(Map<String, dynamic> json) {
    return YouTubeVideo(
      title: json['snippet']['title'] ?? 'No Title',
      description: json['snippet']['description'] ?? 'No Description',
      thumbnailUrl: json['snippet']['thumbnails']['high']['url'] ??
          'https://via.placeholder.com/150',
    );
  }
}
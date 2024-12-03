// search_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/app/ui/screens/tabs/search_page.dart';
import 'dart:convert';

class SearchController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxList<YouTubeVideo> suggestions = <YouTubeVideo>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadMore = false.obs;
  final RxBool hasMore = true.obs;

  // Reactive search query
  final RxString searchQuery = ''.obs;

  // Replace with your actual YouTube Data API key
  static const String apiKey = 'AIzaSyAEjXVvF0yt8Dij6g4YqnV7Ju9iTciy5OY';
  static const String baseUrl = 'https://www.googleapis.com/youtube/v3/search';

  String? _nextPageToken;

  @override
  void onInit() {
    super.onInit();
    // Listen to changes in searchQuery with debounce
    debounce(
      searchQuery,
      (_) => _fetchSuggestions(isNewSearch: true),
      time: Duration(milliseconds: 500),
    );
  }

  @override
  void onClose() {
    // Dispose the TextEditingController
    textController.dispose();
    super.onClose();
  }

  // Update searchQuery whenever text changes
  void onSearchChanged(String query) {
    searchQuery.value = query.trim();
  }

  Future<void> _fetchSuggestions({bool isNewSearch = false}) async {
    final query = searchQuery.value;
    if (query.isEmpty) {
      if (isNewSearch) {
        suggestions.clear();
        hasMore.value = true;
      }
      isLoading.value = false;
      isLoadMore.value = false;
      return;
    }

    if (isNewSearch) {
      isLoading.value = true;
      _nextPageToken = null;
      hasMore.value = true;
    } else {
      if (_nextPageToken == null) {
        // No more data to fetch
        return;
      }
      isLoadMore.value = true;
    }

    try {
      final uri = Uri.parse(baseUrl).replace(queryParameters: {
        'part': 'snippet',
        'type': 'video',
        'maxResults': '10',
        'q': query,
        'key': apiKey,
        if (!isNewSearch && _nextPageToken != null) 'pageToken': _nextPageToken!,
      });

      final response = await http.get(uri);

      if (isClosed) return; // Early exit if controller is disposed

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _nextPageToken = data['nextPageToken'];

        final List<YouTubeVideo> fetchedVideos = [];
        for (var item in data['items']) {
          fetchedVideos.add(YouTubeVideo.fromJson(item));
        }

        if (isNewSearch) {
          suggestions.value = fetchedVideos;
        } else {
          suggestions.addAll(fetchedVideos);
        }

        // If no nextPageToken, no more data
        if (_nextPageToken == null) {
          hasMore.value = false;
        }
      } else {
        // Handle non-200 responses
        if (!isClosed) {
          Get.snackbar('Error', 'Failed to fetch suggestions: ${response.statusCode}');
        }
      }
    } catch (e) {
      // Handle errors
      if (!isClosed) {
        Get.snackbar('Error', 'An error occurred: $e');
      }
    } finally {
      if (isNewSearch) {
        isLoading.value = false;
      } else {
        isLoadMore.value = false;
      }
    }
  }

  Future<void> fetchNextPage() async {
    if (isLoading.value || isLoadMore.value || !hasMore.value) {
      return;
    }
    await _fetchSuggestions(isNewSearch: false);
  }
}
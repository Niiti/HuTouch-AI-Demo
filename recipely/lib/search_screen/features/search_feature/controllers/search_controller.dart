   import 'package:get/get.dart';
   import 'package:http/http.dart' as http;
   import 'dart:convert';

   class SearchController extends GetxController {
     var searchQuery = ''.obs;
     var searchResults = <Map<String, dynamic>>[].obs;
     var isLoading = false.obs;

     Future<void> fetchSearchResults(String query) async {
       const baseUrl = 'https://4c2210a8-b849-4b78-8998-a6d861d8825a.mock.pstmn.io';
       try {
         isLoading(true);
         final category = 'category'; // Define the category variable
         final response = await http.get(Uri.parse('$baseUrl/api/search?query=$query&category=$category'));

         if (response.statusCode == 200) {
           final List<dynamic> results = json.decode(response.body)['results'] ?? [];
           searchResults.value = results.map((item) => Map<String, dynamic>.from(item)).toList();
         } else {
           Get.snackbar('Error', 'Failed to perform search: ${response.statusCode}');
           searchResults.clear();
         }
       } catch (e) {
         Get.snackbar('Error', 'Failed to perform search: $e');
         searchResults.clear();
       } finally {
         isLoading(false);
       }
     }

     void updateSearchQuery(String query) {
       searchQuery.value = query;
       if(query.isNotEmpty) {
         fetchSearchResults(query);
       }
     }
   }
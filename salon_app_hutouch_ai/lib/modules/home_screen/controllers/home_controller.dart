/* SELECTED CODE START */
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var featuredSalons = <FeaturedSalonItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedSalons();
  }


  // void fetchFeaturedSalons() async {
  //   final response = await someApiCallFunction();
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = response.body;  // Changed from response.data to response.body
  //     featuredSalons.value = data.map<FeaturedSalonItem>((item) => FeaturedSalonItem.fromJson(item)).toList();
  //   } else {
  //     // Handle error
  //   }
  // }


  void fetchFeaturedSalons() async {
    final response = await someApiCallFunction();
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      List<dynamic> data = decoded['data']; // accessing the "data" key from JSON
      featuredSalons.value = data
          .map<FeaturedSalonItem>((item) => FeaturedSalonItem.fromJson(item))
          .toList();
    } else {
      // Handle error
      print('Failed to fetch salons: ${response.statusCode}');
    }
  }

  Future<http.Response> someApiCallFunction() async {  // Changed from Future<Response> to Future<http.Response>
    // Updated to make an actual HTTP GET request
    final response = await http.get(Uri.parse("https://run.mocky.io/v3/b51dcce9-f129-4fd0-a952-22643b34f718"));
    return response;
  }
}

class FeaturedSalonItem {
  final String image;
  final String title;
  final String address;
  final double rating;
  final String likeCount;
  final bool isLiked;
  final String content;

  FeaturedSalonItem({
    required this.image,
    required this.title,
    required this.address,
    required this.rating,
    required this.likeCount,
    required this.isLiked,
    required this.content,
  });

  factory FeaturedSalonItem.fromJson(Map<String, dynamic> json) {
    return FeaturedSalonItem(
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      address: json['address'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      likeCount: json['likeCount'] ?? '',
      isLiked: json['isLiked'] ?? false,
      content: json['content'] ?? '',
    );
  }
}
/* SELECTED CODE END */
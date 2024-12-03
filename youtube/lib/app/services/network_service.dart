import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';

import '../constants/app_constants.dart';
import '../controllers/dashboard_controller.dart';

class NetworkService {
  Future<NetworkService> init() async {
    // Initialize network service
    return this;
  }

  static Future<List<Profile>> getProfiles() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    return [
      Profile(image: 'assets/images/Rectangle 7.png', name: 'Like Nastya'),
      Profile(image: 'assets/images/profile.png', name: 'Bassera'),
      Profile(image: 'assets/images/Rectangle 9.png', name: 'Alor Path'),
      Profile(image: 'assets/images/Rectangle 7.png', name: 'Rain Drop..'),
    ];
  }

  static Future<List<Video>> getVideos() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    return [
      Video(
        thumbnail: AppConstants.shortsThumbnail2,
        avatar: AppConstants.profileImage,
        title: 'Heart Touching Nasheed #Shorts',
        views: '19,210,251 views',
        date: 'Jul • 1, 2016',
      ),
      Video(
        thumbnail: AppConstants.shortsThumbnail3,
        avatar: AppConstants.profileImage,
        title: 'Amazing Nature #Shorts',
        views: '10,000,000 views',
        date: 'Aug • 15, 2018',
      ),
      Video(
        thumbnail: AppConstants.shortsThumbnail4,
        avatar: AppConstants.profileImage,
        title: 'Incredible Science #Shorts',
        views: '5,000,000 views',
        date: 'Sep • 10, 2019',
      ),
      Video(
        thumbnail: AppConstants.shortsThumbnail,
        avatar: AppConstants.profileImage,
        title: 'Funny Animals #Shorts',
        views: '8,500,000 views',
        date: 'Oct • 5, 2020',
      ),
    ];

  }

  Future<String> fetchData(String endpoint) async {
    try {
      // Simulate network call
      await Future.delayed(Duration(seconds: 2));
      return 'Data from $endpoint';
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  bool isConnected() {
    // Implement connectivity check
    return true;
  }
}

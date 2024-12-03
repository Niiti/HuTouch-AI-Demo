import 'package:flutter/material.dart';

class AssetService {
  static AssetImage getLogo() {
    return AssetImage('assets/logo/logo.png');
  }

  static AssetImage getProfileImage() {
    return AssetImage('assets/images/profile.png');
  }

  static AssetImage getShortsThumbnail() {
    return AssetImage('assets/images/shorts_thumbnail.png');
  }

  String getVideoPlaceholderPath() {
    return 'assets/images/Rectangle7.png';
  }
}

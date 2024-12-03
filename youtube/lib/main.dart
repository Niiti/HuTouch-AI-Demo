import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/ui/screens/youtube_home.dart';
import 'app/constants/app_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YouTube Clone',
      theme: ThemeData(
        primaryColor: AppConstants.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: YoutubeHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

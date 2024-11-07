import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/app_constants.dart';
import 'views/home_page.dart';

void main() {
  runApp(StylishApp());
}

class StylishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stylish',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: 'Montserrat',
      ),
      home: HomePage(),
    );
  }
}

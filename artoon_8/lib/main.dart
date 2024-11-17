import 'package:artoon_8/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'utils/app_constants.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Features Screen',
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
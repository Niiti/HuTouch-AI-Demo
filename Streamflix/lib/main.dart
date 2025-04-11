import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/themes/app_theme.dart';
import 'package:my_project/core/constants/app_strings.dart';
import 'package:my_project/modules/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditate/core/constants/app_colors.dart';
import 'package:meditate/core/constants/app_strings.dart';
import 'package:meditate/modules/welcome_sleep/views/welcome_sleep_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeSleepScreen(),
    );
  }
}

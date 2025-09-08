import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/routes/app_pages.dart';
import 'package:build_me_up/core/routes/app_routes.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/constants/app_colors.dart';

void main() {
  runApp(const build_me_upApp());
}

class build_me_upApp extends StatelessWidget {
  const build_me_upApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.one,
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brand),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textPrimary),
        ),
      ),
    );
  }
}

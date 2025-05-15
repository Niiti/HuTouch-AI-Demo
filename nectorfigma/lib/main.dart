import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';
import 'package:nectorfigma/core/constants/color_palette.dart';
import 'package:nectorfigma/features/explore_screen/bindings/explore_binding.dart';
import 'package:nectorfigma/features/explore_screen/views/explore_screen.dart';
import 'package:nectorfigma/features/favorites_screen/bindings/favorites_binding.dart';
import 'package:nectorfigma/features/favorites_screen/views/favorites_screen.dart';
import 'package:nectorfigma/features/filters_screen/bindings/filters_binding.dart';
import 'package:nectorfigma/features/filters_screen/views/filters_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      initialBinding: FiltersBinding(),
      home: const FiltersScreen(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPalette.primary),
        fontFamily: 'Gilroy',
      ),
    );
  }
}

class AppStrings {
  static const String appTitle = 'Nector';
}

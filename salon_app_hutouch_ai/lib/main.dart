
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/views/homepage_full.dart';

import 'modules/shop_details_scrolled_service_selected/controllers/shop_details_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShopDetailsController());
    return GetMaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        fontFamily: Fonts.manrope,
      ),
      home: const HomepageFull(),
    );
  }
}
 

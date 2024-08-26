
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/gender_selection/view/gender_selection_screen.dart';
import 'modules/language_selection/language_binding.dart';
import 'modules/language_selection/view/language_selection_screen.dart';
import 'modules/language_selection/view_model/language_view_model.dart';
import 'modules/feature_selection/view/feature_selection_screen.dart';
import 'modules/feature_selection/view_model/feature_selection_view_model.dart';
import 'modules/trending_avatars/view/trending_avatars_screen.dart';
import 'modules/upload/upload_module.dart';


void main() {
  Get.lazyPut(()=>LanguageViewModel());
  Get.lazyPut(() => FeatureSelectionViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialBinding: LanguageBinding(),
      home: LanguageSelectionScreen(),
      getPages: [
        GetPage(name: '/language', page: () => LanguageSelectionScreen(), binding: LanguageBinding()),
        GetPage(name: '/feature', page: () => FeatureSelectionScreen()), 
        GetPage(name: '/upload', page: () => UploadModule()),  // Register the new UploadModule route
        GetPage(name: '/gender', page: () => GenderSelectionScreen()),
        GetPage(name: '/avatar', page:() => TrendingAvatarsScreen()),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/app/routes.dart';
import 'package:my_project/core/app/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Project',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.societies,
      getPages: AppPages.pages,
    );
  }
}

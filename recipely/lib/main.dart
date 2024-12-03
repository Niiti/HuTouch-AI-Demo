import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:recipely/search_screen/app/interface/view/search_interface.dart';
import 'login_screen/ui/pages/login_ui_screen.dart';
import 'home_screen/presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login UI',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginUIScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        // GetPage(name: '/search', page: () => SearchInterface()),
      ],
    );
  }
}

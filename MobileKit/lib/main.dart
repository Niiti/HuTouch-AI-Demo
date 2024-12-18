import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/sign_up/presentations/sign_up_screen.dart';
import 'utils/app_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appTitle,
      home: SignUpScreen(),
    );
  }
}

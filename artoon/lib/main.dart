import 'package:flutter/material.dart';
import 'splash_screen.dart';
// import 'components/';
import 'components/features_selection_screen.dart';
import 'components/language_selection_screen.dart';
import 'components/create_uploaded_photo_screen.dart';
import 'components/select_gender_screen.dart';
import 'components/go_premium_screen.dart';
import 'components/ai_art_home_screen.dart';
import 'components/blank_payment_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Feature App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/select_language': (context) => SelectLanguageScreen(),
        '/features': (context) => FeaturesSelectionScreen(),
        '/language': (context) => SelectLanguageScreen(),
        '/upload_photos': (context) => CreateUploadedPhotoScreen(),
        '/select_gender': (context) => SelectGenderScreen(),
        '/go_premium': (context) => GoPremiumScreen(),
        '/ai_art_home': (context) => AIArtHomeScreen(),
        '/payment': (context) => BlankPaymentPage(),
      },
    );
  }
}

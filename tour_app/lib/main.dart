import 'package:flutter/material.dart';
import 'package:my_project/core/theme/app_theme.dart';
import 'package:my_project/features/tour/presentation/pages/tour_landing_page.dart';
import 'package:my_project/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Landing Page',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const TourLandingPage(),
    );
  }
}
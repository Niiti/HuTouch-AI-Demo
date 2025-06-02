import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';
import 'package:banking_app_hutouch_ai/core/constants/text_style.dart';
import 'package:banking_app_hutouch_ai/core/i18n/translations.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/bindings/account_statistics_binding.dart';
import 'package:banking_app_hutouch_ai/features/account_statistics/views/account_statistics_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Project',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: AccountStatisticsBinding(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: appColorScheme,
        fontFamily: 'Poppins',
      ),
      home: const AccountStatisticsScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hackaton_end/core/constants/app_colors.dart';
import 'package:hackaton_end/core/constants/app_strings.dart';
import 'package:hackaton_end/features/challenge/controllers/challenge_controller.dart';
import 'package:hackaton_end/features/combined/combined_screens.dart';
import 'package:provider/provider.dart';

class HackatonEndApp extends StatelessWidget {
  const HackatonEndApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChallengeController>(
          create: (_) => ChallengeController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            titleMedium: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            bodyMedium: TextStyle(color: AppColors.textPrimary),
            bodySmall: TextStyle(color: AppColors.textSecondary),
          ),
        ),
        home: const CombinedScreens(),
      ),
    );
  }
}

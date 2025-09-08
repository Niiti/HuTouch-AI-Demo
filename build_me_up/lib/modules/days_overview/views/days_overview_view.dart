import 'package:flutter/material.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class DaysOverviewView extends StatelessWidget {
  const DaysOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            AppStrings.daysOverview,
            style: TextStyle(
              fontSize: context.heightUnit * 2.0,
              color: AppColors.textDark,
            ),
          ),
        ),
      ),
    );
  }
}

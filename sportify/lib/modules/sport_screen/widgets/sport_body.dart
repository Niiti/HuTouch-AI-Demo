import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/responsive_helper.dart';
import '../widgets/sport_section_item.dart';
import '../widgets/sport_option_item.dart';
import '../../../constants/app_constants.dart';

class SportBody extends StatelessWidget {
  final double fontSizeScale;

  SportBody({required this.fontSizeScale});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.width * 0.04,
      ),
      children: [
        SportSectionItem(
          title: AppString.myTeams,
          description:
              'Follow your favorite teams for personalized content and recommendations.',
          route: AppConstants.dashBoardRoute,
          fontSizeScale: fontSizeScale,
        ),
        SportSectionItem(
          title: AppString.myPlayers,
          description:
              'Follow your favorite players for personalized content and recommendations.',
          route: AppConstants.playersRoute,
          fontSizeScale: fontSizeScale,
        ),
        SizedBox(height: size.width * 0.04),
        Divider(color: AppColors.textSecondary),

        // Added "OTHERS OPTIONS" below My Players section
        Text(
          'OTHERS OPTIONS',
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 18 * fontSizeScale,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        
        SportOptionItem(
          title: AppString.notifications,
          route: AppConstants.notificationRoute,
          fontSizeScale: fontSizeScale,
        ),
        SportOptionItem(
          title: AppString.privacy,
          route: '/privacy',
          fontSizeScale: fontSizeScale,
        ),
        SportOptionItem(
          title: AppString.customerSupport,
          route: '/customersupport',
          fontSizeScale: fontSizeScale,
        ),
        SportOptionItem(
          title: AppString.appInfo,
          route: '/appinfo',
          fontSizeScale: fontSizeScale,
        ),
      ],
    );
  }
}

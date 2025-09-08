import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';
import 'package:build_me_up/modules/profile/views/profile_view.dart';
import 'package:build_me_up/shared/components/user-avatar-icon-button.dart';

class ChallengeHeaderBar extends StatelessWidget {
  const ChallengeHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
      fontSize: context.heightUnit * 3.1,
      color: AppColors.darkText,
    );

    final avatarSize = context.heightUnit * 4.6;

    return Padding(
      padding: EdgeInsets.only(
        left: context.widthUnit * 4,
        right: context.widthUnit * 4,
        top: context.heightUnit * 2.2,
        bottom: context.heightUnit * 1,
      ),
      child: Row(
        children: [
          Expanded(child: Text(AppStrings.todaysChallenge, style: titleStyle)),
          UserAvatarIconButton(
            onTap: () => Get.to(() => const ProfileView()),
            size: avatarSize,
            backgroundColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

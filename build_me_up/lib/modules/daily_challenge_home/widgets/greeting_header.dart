import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:build_me_up/core/constants/app_colors.dart';
import 'package:build_me_up/core/constants/app_strings.dart';
import 'package:build_me_up/core/routes/app_routes.dart';
import 'package:build_me_up/modules/daily_challenge_home/controllers/home_controller.dart';
import 'package:build_me_up/shared/components/user-avatar-icon-button.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<DailyChallengeHomeController>();
    final titleSize = context.heightUnit * 3.2;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Obx(
            () => Text(
              '[0m${AppStrings.hello} ${c.userName.value}',
              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.w600,
                fontSize: titleSize,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(width: context.widthUnit * 4),
        UserAvatarIconButton(
          size: context.heightUnit * 4.5,
          onTap: () => Get.toNamed(AppRoutes.profile),
          iconColor: Colors.white,
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}
